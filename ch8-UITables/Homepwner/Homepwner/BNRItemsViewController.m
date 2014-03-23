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
    NSInteger numberOfRows = 0;
    if (section==0) //section for <= 50
    {
        for (BNRItem *item in [[BNRItemStore sharedStore] allItems])
        {
            if(item.valueInDollars<=50)
                numberOfRows++;
        }
    }
    else //section for >50
    {
        
        for (BNRItem *item in [[BNRItemStore sharedStore] allItems])
        {
            if(item.valueInDollars>50)
                numberOfRows++;
        }
    }
    return numberOfRows;
}
//bronze challenge end

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
        return @"Value <= 50$";
    else
        return @"Value > 50$";
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //get a new OR recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    //set the text to the description of the item on index/row n
    NSArray *items = [[BNRItemStore sharedStore]allItems];
    BNRItem *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    
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
