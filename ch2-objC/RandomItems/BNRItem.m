//
//  BNRItem.m
//  RandomItems
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (instancetype)randomItem
{
    //immutable array of three adjs
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    //nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Bob"];
    
    //Get index of random adj/noun from list
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    //NSInteger is a "long" number object
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c",
                                    '0' + arc4random()%10,
                                    'A' + arc4random()%20,
                                    '0' + arc4random()%10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;
}


- (NSString *) description
{
    NSString *descriptionString = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    return descriptionString;
}



//INITIALIZERS
- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars: (int)value
                     serialNumber:(NSString *)sNumber
{
    self = [super init];
    
    if (self)
    {
        _itemName = name;
        _valueInDollars = value;
        _serialNumber = sNumber;
        _dateCreated = [[NSDate alloc]init]; //current date and time
    }
    
    return self;
}

- (instancetype) initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:sNumber];
}

- (instancetype) initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueInDollars:0 serialNumber:@""];
}

- (instancetype) init
{
    return [self initWithItemName:@"Item"];
}


//getters and setters
- (void) setItemName:(NSString *)str
{
    _itemName = str;
}

- (NSString *) itemName
{
    return _itemName;
}

- (void) setSerialNumber:(NSString *)str
{
    _serialNumber = str;
}

- (NSString *) serialNumber
{
    return _serialNumber;
}

- (void) setValueInDollars:(int)v
{
    _valueInDollars = v;
}

- (int) valueInDollars
{
    return _valueInDollars;
}

- (NSDate *) dateCreated
{
    return _dateCreated;
}

@end
