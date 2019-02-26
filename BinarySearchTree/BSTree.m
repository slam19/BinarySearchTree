//
//  BSTree.m
//  BinarySearchTree
//
//  Created by Simon Lam on 1/21/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BSTree.h"
@implementation BSTree

-(id) init{
    self = [super init];
    if (self){
        self.root = nil;
    }
    return self;
}

-(void) loadTree:(NSString *)source{ //constructor
    NSArray* myArray = [source componentsSeparatedByString:@","];
    int s =  (int)[myArray count];
    for(int i = 0; i< s; i++){
        NSString *integer=myArray[i];
        int n = [integer intValue];
        [self insert: n];
    }
}

-(bool) insert:(int) i{
    if(!self.root){
        Node *n = [[Node alloc] initWithItem:i];
        self.root = n;
        return true;
    }else{
        return [self insert: i at: self.root];
    }
}

-(bool) insert: (int) i at:(Node *) n{
    if(i == n.item){
        return false;
    }
    
    if(i >n.item){
        if(!n.right){
            Node *temp = [[Node alloc] initWithItem:i];
            n.right = temp;
        }else{
            [self insert: i at: n.right];
        }
    }
    
    if( i < n.item){
        if(!n.left){
            Node *temp = [[Node alloc] initWithItem:i];
            n.left = temp;
        }
        [self insert: i at: n.left];
    }
    
    return true;
}

-(void) printPreOrder:(Node *) n{
    printf("%d, ", n.item);
    
    if(n.left){
        [self printPreOrder:n.left];
    }
    
    
    if(n.right){
        [self printPreOrder:n.right];
    }
}

-(void) printInOrder:(Node *) n{
    if(n.left){
        [self printInOrder:n.left];
    }
    printf("%d, ", n.item);
    
    if(n.right){
        [self printInOrder:n.right];
    }
}

-(void) printPostOrder:(Node *)n {
    if(n.left){
        [self printPostOrder:n.left];
    }
    
    if(n.right){
        [self printPostOrder:n.right];
    }
    
    printf("%d, ", n.item);
    
}

-(int) size:(Node *)n{
    if (!n){
        return 0;
    }else{
        return (1 + [self size: n.left] +[self size: n.right]);
    }
}

-(bool) contains:(int)i at:(Node *)n{
    if(!n){
        return false;
    }
    if(n.item == i){
        return true;
    }
    if(i > n.item){
        return ([self contains: i at: n.right]);
    }else{
        return ([self contains: i at: n.left]);
    }
}

-(int) successorOfNode: (Node *) n {
    if(!n.left){
        return n.item;
    }
    return [self successorOfNode:n.left];
    
}

-(Node *) remove:(int) i at:(Node *)n{
    if(!n){
        return n;
    }
    if(i< n.item){
        n.left = [self remove: i at:n.left];
    }
    if(i>n.item){
        n.right = [self remove: i at:n.right];
    }
    if(i == n.item){
        if(!n.left){
            return n.right; //skips by assignment
        }
        else if(!n.right){
            return n.left;
        }else{
            n.item = [self successorOfNode:n.right]; //replace value at node, then removes the successor's previous location
            n.right = [self remove: n.item at:n.right];
        }
    }
    return n;
}


-(int) sum: (Node *)n{
    if(!n){
        return 0;
    }else{
        return (n.item + [self sum: n.left] + [self sum:n.right]);
    }
}

-(int) countLeaves:(Node *)n{
    if(!n){
        return 0;
    }
    if(!n.left && !n.right){
        return 1;
    }
    return [self countLeaves:n.left] + [self countLeaves: n.right];
}

-(int) height:(Node *)n{
    if(!n){
        return 0;
    }
    int leftHeight =  1+ [self height:n.left];
    int rightHeight = 1+ [self height:n.right];
    if(leftHeight<rightHeight){
        return rightHeight;
    }else{
        return leftHeight;
    }
}



-(int) maxPathSum: (Node *)n{
    if(!n){
        return 0;
    }
    int leftSum = n.item + [self maxPathSum:n.left];
    int rightSum = n.item + [self maxPathSum:n.right];
    if(leftSum<rightSum){
        return rightSum;
    }else{
        return leftSum;
    }
}



@end
