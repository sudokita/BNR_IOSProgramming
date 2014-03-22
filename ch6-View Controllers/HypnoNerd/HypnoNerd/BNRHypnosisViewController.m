//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by sudokita on 3/21/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"BNR HVC loaded its view");
}

- (void) loadView
{
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc]init];
    
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        //set tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        //create uiImage from file
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        
        //put it on the tab bar. awwww yis.
        self.tabBarItem.image = i;
        
        
    }
    
    return self;
}

@end
