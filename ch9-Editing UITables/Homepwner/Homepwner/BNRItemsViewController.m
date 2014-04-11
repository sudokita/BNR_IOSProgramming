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

@interface BNRItemsViewController()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController

//BRONZE Challenge - rename delete button
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"Remove";
}

//GOLD Challenge - freeze last row - still need to make it undeletable and fix the moving issue
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems] count];
    if (indexPath.row == lastRow) // Don't move the last row
    {
        //unmoveable
        return NO;
    }
    
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems] count];
    if (indexPath.row == lastRow) // Don't move the last row
    {
        //unmoveable
        return NO;
    }
    
    return YES;
}


- (void)tableView:(UITableView *) tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //if to index is the last position, auto -1
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems]count]+1;
    
    if (destinationIndexPath.row == lastRow)
    {
        destinationIndexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
         [[BNRItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    }
    else
    {
        [[BNRItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    //don't let things go beneath the last row - FIX ME EEEEEE
    }
}

- (void)tableView:(UITableView *) tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //if the table view is asking to commit a delete command
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {

        // remove item from store
        NSArray *items = [[BNRItemStore sharedStore]allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore]removeItem:item];
        
        //remove row from table
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}


- (IBAction)addNewItem:(id)sender
{
    //make new index path for the 0th section, last row
    
    //make new item
    BNRItem *newItem = [[BNRItemStore sharedStore]createItem];
    //find its spot
    NSInteger lastRow = [[[BNRItemStore sharedStore]allItems]indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    //insert row
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingMode:(id)sender
{
    //if you are currently in editing mode
    if(self.isEditing)
    {
        //change button text
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        
        //turn off editing mode
        [self setEditing:NO animated:YES];
    }
    else
    {
        //change button text
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        //turn off editing mode
        [self setEditing:YES animated:YES];
    }
    
}

- (UIView *) headerView //lazy instantiation puts off creating the object until it is actually needed
{
    if(!_headerView)
    {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    
    return _headerView;
}


-(void) viewDidLoad
{
    //give view control to Apple to decide when cells need to be instantiated
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    //load headerView
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
    
    
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //get a new OR recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    //set the text to the description of the item on index/row n
    NSArray *items = [[BNRItemStore sharedStore]allItems];
    
    
    
    //SILVER Challenge
    if([indexPath row] < [[[BNRItemStore sharedStore] allItems] count]) {
        BNRItem *item = items[indexPath.row];
        cell.textLabel.text = [item description];
    } else
    {
        [[cell textLabel] setText:@"No more items!"];
    }
    
    return cell;
}


-(instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self)
    {}
    
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

@end
