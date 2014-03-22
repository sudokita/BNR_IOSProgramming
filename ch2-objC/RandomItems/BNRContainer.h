//
//  BNRContainer.h
//  RandomItems
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

//Gold Challenge
#import "BNRItem.h"

@interface BNRContainer : BNRItem
{
    NSMutableArray * _subitems;
}

//designated initializer; container with one BNRItem
- (instancetype) initWithItemName:(NSString *)name
                     valueInDollars:(int)value
                     serialNumber:(NSString *)sNumber;

//getters and setters
- (void) addSubitems:(BNRItem *)subitem;
- (int) valueInDollars;

@end
