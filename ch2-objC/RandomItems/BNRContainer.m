//
//  BNRContainer.m
//  RandomItems
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

//Gold Challenge
#import "BNRContainer.h"

@implementation BNRContainer


- (NSString *) description
{

    // name of container, value in dollars (sum of items and value of container), list of every instance contained
    
    //    NSMutableString - MUTABLE string, hah.
    
    NSMutableString *descriptionString = [[NSMutableString alloc] initWithFormat:@"Container for: %@ (%@):Worth $%d, recorded on %@", self.itemName, self.serialNumber, self.valueInDollars, self.dateCreated];
    
    //add descriptions of all subitems
    for(BNRItem * subitem in _subitems)
    {
        [descriptionString appendFormat:@"\n\t%@", subitem];
    }
    
    return descriptionString;
}

//INITIALIZERS
- (instancetype) initWithItemName:(NSString *)name
                   valueInDollars:(int)value
                     serialNumber:(NSString *)sNumber
{
    self = [super initWithItemName:name valueInDollars:value serialNumber:sNumber];
    
    if(self)
    {
        _subitems = [[NSMutableArray alloc] init];
    }
    
    return self;
}


//getters and setters
- (void) addSubitems:(BNRItem *)subitem
{
    [_subitems addObject:subitem];
    self.valueInDollars+=subitem.valueInDollars;
}


- (int) valueInDollars
{
    int runningTotal = 0;
    
    //value of all subitems
    for (BNRItem * subitem in _subitems)
    {
        runningTotal += [subitem valueInDollars];
    }
    
    //add value of container itself
    runningTotal+= [super valueInDollars];
    
    return runningTotal;
}

@end
