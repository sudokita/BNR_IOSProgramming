//
//  BNRItemStore.m
//  Homepwner
//
//  Created by sudokita on 3/22/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

- (BNRItem *) creatItem
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
