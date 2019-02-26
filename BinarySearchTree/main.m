//
//  main.m
//  BinarySearchTree
//
//  Created by Simon Lam on 1/20/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSTree.h"
#import "SymbolTableAnalysis.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
//UNCOMMENT BELOW TO CONDUCT SYMBOL TABLE ANALYSIS
//        SymbolTableAnalysis *experiment = [[SymbolTableAnalysis alloc]init];
//        [experiment compareRunTime];
        
        BSTree *tree = [[BSTree alloc]init];

        NSString *source= @"2,1,4,3,8,5,9,6,7"; //edit tree input here (seperate numbers by commas, no spaces)

        [tree loadTree: source];

        printf("In Order: ");
        [tree printInOrder:tree.root];
        printf("\n");

        printf("Pre Order: ");
        [tree printPreOrder:tree.root];
        printf("\n");

        printf("Post Order: ");
        [tree printPostOrder:tree.root];
        [tree remove:3 at:tree.root];
        printf("\n");

        printf("Tree height: %d", [tree height:tree.root]);
        printf("\n");

        int num  = 4;
        if([tree contains: num at: tree.root]){
            printf("Tree contains %d", num);
        }else{
            printf("Tree does not contain %d", num);
        }
        printf("\n");

        printf("Tree size: %d", [tree size:tree.root]);
        printf("\n");

        printf("Tree sum: %d", [tree sum: tree.root]);
        printf ("\n");

        printf ("Tree leaf count: %d", [tree countLeaves:tree.root]);
        printf("\n");

        printf("Max path: %d", [tree maxPathSum:tree.root]);
        printf("\n");
      
    }
    
    return 0;
}
