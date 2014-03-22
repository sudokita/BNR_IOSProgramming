//
//  BNRItem.h
//  RandomItems
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import <Foundation/Foundation.h>

//superclass is NSObject remember C?
@interface BNRItem : NSObject
{
    //instance variables of BNRItem
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
}

//the + denotes a class method
+ (instancetype)randomItem;


//alternative constructors/initializers

//designated initializer
- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars: (int)value
                     serialNumber:(NSString *)sNumber;

- (instancetype) initWithItemName:(NSString *)str;


- (instancetype) initWithItemName:(NSString *)str serialNumber:(NSString *)sNumber;

//getters and setters
- (void) setItemName:(NSString *)str; //setter
- (NSString *) itemName; //getter

- (void) setSerialNumber:(NSString *)str;
- (NSString *) serialNumber;

- (void) setValueInDollars:(int)v;
- (int) valueInDollars;

- (NSDate *) dateCreated; //getter  - in obj-c getters are just the name of the var
@end
