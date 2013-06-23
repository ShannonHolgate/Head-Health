//
//  MainViewController.h
//  Head Health
//
//  Created by Bradley on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{

}

@property (nonatomic, retain) IBOutlet UIView *placeholder;
@property (nonatomic, retain) IBOutlet UILabel *name;

-(IBAction)howAreYou:(id)sender;
-(IBAction)homeworkView:(id)sender;
-(IBAction)healthPlanView:(id)sender;
-(IBAction)logOut:(id)sender;

@end
