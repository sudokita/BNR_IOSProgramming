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

#import "BNRImageStore.h"


@implementation BNRItemsViewController


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc]init];
    
    NSArray *items = [[BNRItemStore sharedStore]allItems];
    BNRItem *selectedItem = items[indexPath.row];
    
    detailViewController.item = selectedItem;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)tableView:(UITableView *) tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore]moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
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


-(void) viewDidLoad
{
    //give view control to Apple to decide when cells need to be instantiated
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
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
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        //create new bar button item
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

@end
