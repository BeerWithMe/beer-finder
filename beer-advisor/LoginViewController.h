//
//  LoginViewController.h
//  MessageApp
//
//  Created by Samuel Nelson on 10/3/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) NSString *username;
@property (weak, nonatomic) NSString *password;

- (IBAction)login:(id)sender;


@end
