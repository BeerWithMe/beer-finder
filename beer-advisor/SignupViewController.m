//
//  SignupViewController.m
//  MessageApp
//
//  Created by Samuel Nelson on 10/3/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import "SignupViewController.h"
#import <Parse/Parse.h>

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = NO;

    // Do any additional setup after loading the view.
}

- (IBAction)signup:(id)sender {
    self.username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
   // NSLog(@"username: %@", self.username);
    //NSLog(@"password: %@", self.password);
    //NSLog(@"email!!: %@", self.email);
    
    [self executePostCall];
    
    if (self.signUpCheck) { //This line should check to see if the sign up passes the server test.  If it passes then the new user will be tracked on the parse server/database as well.  This will allow for faster login later on.
        
        if ([self.username length] == 0 || [self.password length] == 0 || [self.email length] == 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a valid username, password, and  email address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
        } else {
            //Create new user
            PFUser *newUser = [PFUser user];
            newUser.username = self.username;
            newUser.password = self.password;
            newUser.email = self.email;
            
            [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alertView show];
            } else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
        }
    }
}

- (NSData *)executePostCall  {
    
    NSMutableDictionary *postDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.password, @"password", self.username, @"username", nil];
    //NSLog(@"my post dictionary: %@", postDictionary);
    
    NSURL * url = [NSURL URLWithString:@"http://beerme.azurewebsites.net/IOSsignup"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSError * error = nil;
    NSData * postData = [NSJSONSerialization dataWithJSONObject:postDictionary options:NSJSONWritingPrettyPrinted error:&error];
    
//    requestFields = [requestFields stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //These two lines allow you to transmit a string exactly how you have it written.
//    NSData *requestData = [requestFields dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = postData;
    request.HTTPMethod = @"POST";
    
    NSHTTPURLResponse *response = nil;
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *headers = [response allHeaderFields];
    NSLog(@"HEADERS!!!: %@", headers);
    
    if (error == nil && [headers[@"x-signup-status"] isEqualToString:@"SUCCESS"]) { //note the "ToString after isEqual.  This is different than in the login view.  Test this when new server is deployed.
        self.signUpCheck = YES;
       // NSLog(@"%li", (long)response.statusCode);
       // NSLog(@"response message: %@", response);
    } else {  //Possibly change this to an else if statement that checks if the x-signup-status header is equal to FAILURE
        self.signUpCheck = NO;
        //NSLog(@"Error!!!!!!!!!!!!!!!!fjoasndfosaidnfaskn!!!!!!: %@", error);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Username already taken." message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
        //Display a message here
        //Error handling
    }
    
    return responseData;
}

@end
