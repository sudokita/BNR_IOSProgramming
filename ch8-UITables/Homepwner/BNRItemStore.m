//
//  BNRItemStore.m
//  Homepwner
//
//  Created by sudokita on 3/22/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRItemStore.h"

@implementation BNRItemStore

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
    return self;
}

@end
