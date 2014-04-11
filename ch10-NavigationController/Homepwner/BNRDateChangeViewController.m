//
//  BNRDateChangeViewController.m
//  Homepwner
//
//  Created by sudokita on 4/10/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRDateChangeViewController.h"
#import "BNRItem.h"

@interface BNRDateChangeViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *changeDate;

@end

@implementation BNRDateChangeViewController

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //clear first responder
    [self.view endEditing:YES];
    
    //save changes
    BNRItem *item = self.item;
    item.dateCreated = self.changeDate.date;
}
@end