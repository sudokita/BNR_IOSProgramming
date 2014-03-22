//
//  main.m
//  RandomPossession
//
//  Created by sudokita on 3/20/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        //create a mutable array object, store addy in item var
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
//        for (int i = 0; i < 10; i++) {
//            BNRItem *item = [BNRItem randomItem];
//            [items addObject:item];
//        }
        
        BNRItem *backpack = [[BNRItem alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        BNRItem *calculator= [[BNRItem alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        calculator.container = backpack;
        
        backpack=nil;
        calculator=nil;
        
        for (BNRItem *item in items)
        {
            NSLog(@"%@", item);
        }
        
        //destroy mutable array
        NSLog(@"Setting items to nil");
        items = nil;
        
        
    }
    return 0;
}