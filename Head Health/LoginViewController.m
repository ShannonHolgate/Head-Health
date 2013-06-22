//
//  LoginViewController.m
//  Head Health
//
//  Created by Shannon Holgate on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize usernameField, passwordField, placeholder;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    usernameField.delegate = self;
    passwordField.delegate = self;
    
    placeholder.layer.shadowColor = [UIColor purpleColor].CGColor;
    placeholder.layer.shadowOffset = CGSizeMake(0, 1);
    placeholder.layer.shadowOpacity = 1;
    placeholder.layer.shadowRadius = 1.0;
    placeholder.clipsToBounds = NO;
    
}

- (IBAction)login:(id)sender
{
    NSString *username = usernameField.text;
    NSString *password = passwordField.text;
    
    if ([username length] == 0 || [password length] == 0)
    {
        NSLog(@"Username or Password empty");
        [self loginError:usernameError];
        return;
    }
    else
    {
        //Do something here to grab the login
        //Do something else if the username is not found or password is incorrect
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)loginError:(loginErrors)error
{
    UIAlertView * alert;
    if (error == usernameError)
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Username is incorrect or does not exist" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    }
    else if(error == passwordError)
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Password is incorrect" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    }
    else if (error == generalError)
    {
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"General error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    }
    else{
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"General error" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    }
    
    if (nil !=alert)
    {
        [alert show];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
