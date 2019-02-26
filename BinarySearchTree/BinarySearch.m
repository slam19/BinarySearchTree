//
//  BinarySearch.m
//  BirthdayProblem
//
//  Created by Simon Lam on 1/6/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BinarySearch.h"

@implementation BinarySearch

-(void) loadArray{
    self.comparisonCounter=0;
    self.list = [[NSMutableArray alloc] init];
    self.item = 1000030;
    self.listSize = 1000000;
    for(int i =0; i<self.listSize; i++){
        [self.list addObject:[[NSNumber alloc]initWithInt:i]];
    }
    
}

-(int) binarySearchWith: (int) left and: (int) right{
    if (right>=left) {
        int middle = left+(right-left)/2;
        int mVal= (int) [[self.list objectAtIndex:middle]integerValue];
        if (self.item == mVal){
            return middle;
        }
        if (self.item<mVal){
            self.comparisonCounter++;
            return [self binarySearchWith:left and: middle-1];
        }else{
            self.comparisonCounter++;
            return [self binarySearchWith:middle+1 and:right];
        }
    }
    return -1;
}
@end
