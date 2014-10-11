//
//  LoginViewController.m
//  MessageApp
//
//  Created by Samuel Nelson on 10/3/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//not in here

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
}

- (IBAction)login:(id)sender {
    self.username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    [self executePostCall];
    
    
    ////////////////////////////////////////
    //////////PARSE LOGIN///////////////////
    ///////////////////////////////////////
//As of right now a user has to sign up for an iOS specific account....  No, that won't work.  For the MVP I guess...
        if ([self.username length] == 0 || [self.password length] == 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a valid username and password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
        } else {
            [PFUser logInWithUsernameInBackground:self.username password:self.password
                                            block: ^(PFUser *user, NSError *error) {
                                                if (error) {
                                                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                                                    [alertView show];
                                                } else {
                                                    [self.navigationController popToRootViewControllerAnimated:YES];
                                                }
                                            
                                            }];
        }
    
    
}


- (NSData *)executePostCall  {
    
    NSMutableDictionary *postDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.password, @"password", self.username, @"username", nil];
    //NSLog(@"my post dictionary: %@", postDictionary);
    
    NSURL * url = [NSURL URLWithString:@"http://beerme.azurewebsites.net/IOSlogin"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError * error = nil;
    NSData * postData = [NSJSONSerialization dataWithJSONObject:postDictionary options:NSJSONWritingPrettyPrinted error:&error];

    request.HTTPBody = postData;
    request.HTTPMethod = @"POST";
    
    NSHTTPURLResponse *response = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error == nil && response.statusCode == 200) {
      //  NSLog(@"%li", (long)response.statusCode);
      //  NSLog(@"response message: %@", response);
        //[self.navigationController popToRootViewControllerAnimated:YES];

    } else {
        //NSLog(@"Error!!!!!!!!!!!!!!!!fjoasndfosaidnfaskn!!!!!!: %@", error);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Login failed" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    
    return responseData;
}

@end
