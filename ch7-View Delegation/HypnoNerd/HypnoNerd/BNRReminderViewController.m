//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by sudokita on 3/21/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNR RVC loaded its view");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting remidner for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc]init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
}


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        //set tab bar item's title
        self.tabBarItem.title = @"Reminder";
        
        //create uiImage from file
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        
        //put it on the tab bar. awwww yis.
        self.tabBarItem.image = i;
    }
    
    return self;
}
@end
