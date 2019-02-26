//
//  BinarySearch.h
//  BirthdayProblem
//
//  Created by Simon Lam on 1/6/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef BinarySearch_h
#define BinarySearch_h
@interface BinarySearch: NSObject

@property NSMutableArray *list;
@property int item;
@property int listSize;
@property int comparisonCounter;

-(void) loadArray;
-(int) binarySearchWith: (int) l and:(int) r;

@end
#endif /* BinarySearch_h */
