//
//  UpdateViewController.m
//  Head Health
//
//  Created by Bradley on 22/06/2013.
//  Copyright (c) 2013 Health Hack. All rights reserved.
//

#import "UpdateViewController.h"
#import "AppDelegate.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController
@synthesize messageText, tap, verySad, sad, happy, veryHappy, images;

int moodInt;

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
    [self.navigationController setNavigationBarHidden:NO];
    self.title = @"Update View";
    [super viewDidLoad];
    
    messageText.clipsToBounds = YES;
    messageText.layer.cornerRadius = 15.0f;
    
    tap = [[UITapGestureRecognizer alloc]
           initWithTarget:self
           action:@selector(dismissKeyboard:)];
    
    [self.view addGestureRecognizer:tap];
    
    verySad.tag = 1;
    sad.tag = 2;
    happy.tag = 3;
    veryHappy.tag = 4;
    
    UITapGestureRecognizer *viewTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectView:)];
    UITapGestureRecognizer *viewTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectView:)];
    UITapGestureRecognizer *viewTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectView:)];
    UITapGestureRecognizer *viewTap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectView:)];
    
    [verySad addGestureRecognizer:viewTap1];
    [sad addGestureRecognizer:viewTap2];
    [happy addGestureRecognizer:viewTap3];
    [veryHappy addGestureRecognizer:viewTap4];
    
    images = [NSArray arrayWithObjects:verySad, sad, happy, veryHappy, nil];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)selectView:(UITapGestureRecognizer *)gesture
{
    for (int i=0; i<[images count]; i++) {
        UIImageView * tempView = [images objectAtIndex:i];
        tempView.backgroundColor = nil;
    }
    
    UIView *image = [(UIGestureRecognizer *)gesture view];
    image.backgroundColor = [UIColor whiteColor];
    image.clipsToBounds = YES;
    image.layer.cornerRadius = 15.0f;
    
    moodInt = image.tag;
    NSLog(@"mood int: %i", moodInt);
}
- (IBAction)saveInfo:(id)sender
{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSString * message = [messageText.text stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    NSString *postString = [NSString stringWithFormat:@"http://headhealth.herokuapp.com/services/insertMoodForUserId?Message=%@&MoodNumber=%i&UserId=%@",message,moodInt,[appDelegate.userDict objectForKey:@"id"]];
    NSString * formattedString = [postString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *aUrl = [NSURL URLWithString:formattedString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:aUrl
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    NSLog(@"url = %@",formattedString);
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                 delegate:self];
    [connection start];
    
}

-(void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else
    {
        //do nothing
    }
}

-(void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Thank You!"
                                                      message:@"Your information has been saved successfully"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    message.tag = 1;
    [message show];
}

-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:@"Something went wrong"
                                                     delegate:self
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    message.tag = 2;
    [message show];
}

-(void)dismissKeyboard:(UITapGestureRecognizer *)gestureRecognizer {
    [messageText resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
