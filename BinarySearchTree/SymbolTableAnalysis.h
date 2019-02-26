//
//  SymbolTableAnalysis.h
//  BinarySearchTree
//
//  Created by Simon Lam on 2/22/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef SymbolTableAnalysis_h
#define SymbolTableAnalysis_h
#import "BSTree.h"
#import "BinarySearch.h"

@interface SymbolTableAnalysis <ObjectType>: NSObject

@property BSTree* myTree;
@property int* BSArray;
@property int key;
@property int N;

-(void) compareRunTime;


@end
#endif /* SymbolTableAnalysis_h */
