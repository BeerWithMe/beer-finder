//
//  LoginViewController.m
//  MessageApp
//
//  Created by Samuel Nelson on 10/3/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    // Do any additional setup after loading the view.
}

- (IBAction)login:(id)sender {
        NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([username length] == 0 || [password length] == 0) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a valid username and password." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
        } else {
            [PFUser logInWithUsernameInBackground:username password:password
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

@end
