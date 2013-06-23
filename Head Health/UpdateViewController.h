//
//  UpdateViewController.h
//  Head Health
//
//  Created by Bradley on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate,UIAlertViewDelegate>

@property (nonatomic, retain) IBOutlet UITextView *messageText;
@property (nonatomic, retain) UITapGestureRecognizer *tap;

@property (nonatomic, retain) IBOutlet UIImageView *verySad;
@property (nonatomic, retain) IBOutlet UIImageView *sad;
@property (nonatomic, retain) IBOutlet UIImageView *happy;
@property (nonatomic, retain) IBOutlet UIImageView *veryHappy;

@property (nonatomic, retain) NSArray *images;


@end
