//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by sudokita on 4/20/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void) loadView
{
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
