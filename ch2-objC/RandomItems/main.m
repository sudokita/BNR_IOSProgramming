//
//  main.m
//  RandomItems
//
//  Created by sudokita on 3/19/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //create a mutable array object, store addy in item var
        NSMutableArray *items = [[NSMutableArray alloc]init];
        
        
        //GOLD challenge: container with 10 subitems
        BNRContainer *container = [BNRContainer randomItem];
        
        
        for (int i = 0; i<10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [container addSubitems:item];
        }

        NSLog(@"%@", container);
        
    
        //chapter 1 stuff
        for (int i = 0; i < 10; i++) {
            BNRItem *item = [BNRItem randomItem];
            [items addObject:item];
        }
        
        for (BNRItem *item in items)
        {
            NSLog(@"%@", item);
        }
        
        
        //destroy mutable array object
        
        NSLog(@"Setting items to nil");
        items = nil;
        
        
    }
    return 0;
}

