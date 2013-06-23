//
//  LoginViewController.h
//  Head Health
//
//  Created by Shannon Holgate on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, retain) IBOutlet UITextField *usernameField;
@property (nonatomic, retain) IBOutlet UITextField *passwordField;
@property (nonatomic, retain) IBOutlet UIView *placeholder;

-(IBAction)login:(id)sender;

typedef enum {
    usernameError,
    passwordError,
    generalError
} loginErrors;

-(void)loginError:(loginErrors)error;

@end
