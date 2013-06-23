//
//  MainViewController.m
//  Head Health
//
//  Created by Bradley on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import "MainViewController.h"
#import "UpdateViewController.h"
#import "HomeworkViewController.h"
#import "HealthPlanViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize placeholder, name;

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
    self.title  = @"Main";
    [self.navigationController setNavigationBarHidden:YES];
    [super viewDidLoad];
    
    placeholder.layer.cornerRadius = 15.0f;
    placeholder.clipsToBounds = NO;
    

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

-(void)viewDidAppear:(BOOL)animated
{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    if (!appDelegate.loggedin)
    {
        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
        
        // show the navigation controller modally
        [self presentViewController:login animated:NO completion:nil];
        
    }
    else
    {
        name.text = [appDelegate.userDict objectForKey:@"name"];
    }
}

-(IBAction)logOut:(id)sender
{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.loggedin = false;
    name.text = @"";
    LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
    
    // show the navigation controller modally
    [self presentViewController:login animated:NO completion:nil];
    
}
-(IBAction)howAreYou:(id)sender
{
    UpdateViewController * howareyou = [[UpdateViewController alloc]initWithNibName:@"UpdateViewController" bundle:nil];
    
    [self.navigationController pushViewController:howareyou animated:YES];
}
-(IBAction)homeworkView:(id)sender
{
    HomeworkViewController * homeworkvc = [[HomeworkViewController alloc]initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:homeworkvc animated:YES];
}
-(IBAction)healthPlanView:(id)sender
{
    HealthPlanViewController * healthplanview = [[HealthPlanViewController alloc]initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:healthplanview animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
