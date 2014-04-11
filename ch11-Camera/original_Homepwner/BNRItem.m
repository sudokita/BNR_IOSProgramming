//
//  BNRItem.m
//  RandomItems
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRItem.h"

//actually implement the different methods declared in the .h interface file

@implementation BNRItem


- (NSString *) description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descriptionString;
}

- (void) dealloc
{
    NSLog(@"Destroyed: %@", self);
}

+ (instancetype)randomItem
{
    //immutable array of three adjs and three nouns
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Bob"];
    
    //Get index of random adj/noun from list
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c",
                                    '0' + arc4random()%10,
                                    'A' + arc4random()%20,
                                    '0' + arc4random()%10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}


//INITIALIZERS
- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars: (int)value
                     serialNumber:(NSString *)sNumber
{
    self = [super init]; //call the superclasses designated initializer, superclass was NSObject as was written in the header file, so it's calling init from NSObject
    
    if (self)
    {
        // Give the instance variables initial values
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        self.dateCreated = [[NSDate alloc] init];
        
        //create NSSUUID object for the key
        NSUUID *uuid = [[NSUUID alloc]init];
        NSString *key = [uuid UUIDString];
        _imageKey = key;
    }
    
    return self;
}

- (instancetype) initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype) init
{
    return [self initWithItemName:@"Item"];
}

@end
