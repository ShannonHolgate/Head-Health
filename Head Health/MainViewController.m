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

@interface MainViewController ()

@end

@implementation MainViewController

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)howAreYou:(id)sender
{
    UpdateViewController * howareyou = [[UpdateViewController alloc]initWithNibName:@"UpdateViewController" bundle:nil];
    
    [self.navigationController pushViewController:howareyou animated:YES];
}
-(IBAction)homeworkView:(id)sender
{
    HomeworkViewController * homeworkvc = [[HomeworkViewController alloc]initWithNibName:@"HomeworkViewController" bundle:nil];
    
    [self.navigationController pushViewController:homeworkvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
