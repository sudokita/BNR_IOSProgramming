//
//  BNRImageStore.m
//  Homepwner
//
//  Created by sudokita on 4/11/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRImageStore.h"

@interface BNRImageStore()
@property (nonatomic, strong) NSMutableDictionary *dictionary;
@end

@implementation BNRImageStore

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void) deleteImageForKey:(NSString *)key
{
    if(!key)
    {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}


//SINGLETON status
+(instancetype)sharedStore
{
    static BNRImageStore *sharedStore = nil;
    
    if(!sharedStore)
    {
        sharedStore = [[self alloc]initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [BNRImageStore sharedStore]" userInfo:nil];
}

//secrete designated initializer
- (instancetype)initPrivate
{
    self = [super init];
    
    if(self)
    {
        _dictionary = [[NSMutableDictionary alloc]init];
    }
    
    return self;
}

@end
