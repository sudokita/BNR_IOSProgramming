//
//  BNRItem.h
//  RandomItems
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

+ (instancetype)randomItem;

- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars: (int)value
                     serialNumber:(NSString *)sNumber;

- (instancetype) initWithItemName:(NSString *)str;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, copy) NSDate *dateCreated;

@end
