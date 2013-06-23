//
//  LoginViewController.m
//  Head Health
//
//  Created by Shannon Holgate on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

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
    
    placeholder.layer.cornerRadius = 15.0f;
    placeholder.clipsToBounds = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
}

- (IBAction)login:(id)sender
{
    NSString *username = usernameField.text;
    NSString *password = passwordField.text;
    
    /*if ([username length] == 0 || [password length] == 0)
    {
        NSLog(@"Username or Password empty");
        [self loginError:usernameError];
        return;
    }
    else
    {
        NSString * urlString = [NSString stringWithFormat:@"http://headhealth.herokuapp.org/services/authenticate?UserId=%@&password=%@",username, password];
        NSString * formattedURL = [urlString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
        //Do something here to grab the login
        //Do something else if the username is not found or password is incorrect
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:formattedURL]];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:YES];
        });
        
    }
     */
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.loggedin = YES;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;
    
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.userDict = [NSJSONSerialization JSONObjectWithData:responseData
                                                                options:kNilOptions
                                                                error:&error];
    
    if (nil != appDelegate.userDict)
    {
        NSLog(@"name: %@", [appDelegate.userDict objectForKey:@"name"]);
        appDelegate.loggedin = YES;
        
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self loginError:usernameError];
        [self dismissKeyboard];
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

-(void)dismissKeyboard {
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
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
