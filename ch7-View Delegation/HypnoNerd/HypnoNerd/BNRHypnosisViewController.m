//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by sudokita on 3/21/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController() <UITextFieldDelegate>
@end

@implementation BNRHypnosisViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNR HVC loaded its view");
}

- (void) loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]init];
    
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone; //changes return key to read "Done" indicating event end

    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    self.view = backgroundView;
}

- (void) drawHypnoticMessage: (NSString *)message
{
    for(int i = 0; i <20; i++)
    {
        UILabel *messageLabel = [[UILabel alloc]init];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        
        [messageLabel sizeToFit]; //resize label to text
        
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        int height =  (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        //update frame of label
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        //add label
        [self.view addSubview:messageLabel];
        
        //make messages swaaaaaay - this would only be visible on an actual device
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        
    }
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    
    //clear textfield
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        //set tab bar item's title
        self.tabBarItem.title = @"Hypnosis";
        
        //create uiImage from file
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //put it on the tab bar. awwww yis.
        self.tabBarItem.image = i;
    }
    
    return self;
}

@end
