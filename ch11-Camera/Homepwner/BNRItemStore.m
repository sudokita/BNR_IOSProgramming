//
//  BNRItemStore.m
//  Homepwner
//
//  Created by sudokita on 3/22/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
#import "BNRImageStore.h"


@interface BNRItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

- (void) moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex
{
    if(fromIndex == toIndex)
    {
        return;
    }
    //get pointer to object being moved so you can reinsert it
    BNRItem *item = self.privateItems[fromIndex];
    

    //remove item
    [self.privateItems removeObjectAtIndex:fromIndex];
    
    //add it at new position
    [self.privateItems insertObject:item atIndex:toIndex];
}

- (void) removeItem:(BNRItem *)item
{
    NSString *key = item.imageKey;
    [[BNRImageStore sharedStore]deleteImageForKey:key];
    [self.privateItems removeObjectIdenticalTo:item];
}


- (BNRItem *) createItem
{
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}

+ (instancetype) sharedStore
{
    static BNRItemStore *sharedStore = nil;
    
    //Does it already exist? - singleton check
    if(!sharedStore)
    {
        sharedStore = [[self alloc]initPrivate];
    }
    
    return sharedStore;
}

- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [BNRItemStore sharedStore]" userInfo:nil];
    
    return nil;
}

- (instancetype) initPrivate
{
    self = [super init];
    if (self)
    {
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSArray *)allItems
{
    return self.privateItems;
}

@end
