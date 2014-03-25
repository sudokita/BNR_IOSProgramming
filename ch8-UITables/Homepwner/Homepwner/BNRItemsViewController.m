//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by sudokita on 3/22/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController


-(void) viewDidLoad
{
    //give view control to Apple to decide when cells need to be instantiated
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


//bronze challenge - set number of sections to 2, one for <=50, one for >50
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

//change number of rows in each section depedning on the filter
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSPredicate *predicate;
    if (section == 0) {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
    }
    else
    {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
    }
    
    NSArray *items = [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:predicate];
    NSInteger numRows = [items count];
    return numRows;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
        return @"Value <= 50$";
    else
        return @"Value > 50$";
}


//silver challenge
- (NSString *)tableView:(UITableView *)tv titleForFooterInSection:(NSInteger)section
{
    if (section == 1)
        return @"No More Items";
    else
        return @"";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    //use predicates to filter items accordingly
    NSPredicate *predicate;
    if ([indexPath section] == 0) {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars <= 50"];
    } else {
        predicate = [NSPredicate predicateWithFormat:@"valueInDollars > 50"];
    }
    
    NSArray *items= [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:predicate];
    BNRItem *item = [items objectAtIndex:indexPath.row];
    cell.textLabel.text = item.description;
    return cell;
}


-(instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self)
    {
        for(int i=0; i<5; i++)
        {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

@end
