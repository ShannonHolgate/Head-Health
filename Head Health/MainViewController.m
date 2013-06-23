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

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize placeholder;

BOOL loggedin = false;

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
    
    placeholder.layer.shadowColor = [UIColor purpleColor].CGColor;
    placeholder.layer.shadowOffset = CGSizeMake(0, 1);
    placeholder.layer.shadowOpacity = 1;
    placeholder.layer.shadowRadius = 1.0;
    placeholder.clipsToBounds = NO;
    
    if (!loggedin)
    {
        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];

        // show the navigation controller modally
        [self presentViewController:login animated:NO completion:nil];
        
    }
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [super viewWillAppear:YES];
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
