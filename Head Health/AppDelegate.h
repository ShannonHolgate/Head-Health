//
//  AppDelegate.h
//  Head Health
//
//  Created by Shannon Holgate on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MainViewController * firstView;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) MainViewController * firstView;

@end
