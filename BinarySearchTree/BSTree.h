//
//  BSTree.h
//  BinarySearchTree
//
//  Created by Simon Lam on 1/21/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#ifndef BSTree_h
#define BSTree_h
#import "Node.h"

@interface BSTree: NSObject

@property Node *root;
//@property int count; 

-(id) init;
-(bool) insert: (int) i;
-(bool) insert: (int) i at:(Node *) n;
-(void) loadTree: (NSString *) source;
-(void) printPreOrder: (Node *) n;
-(void) printInOrder: (Node *) n;
-(void) printPostOrder: (Node *) n;
-(int) size: (Node *) n;
-(Node *) remove: (int) i at:(Node *)n;
-(bool) contains: (int) i at:(Node *) n;
-(int) sum: (Node *)n;
-(int) countLeaves: (Node *)n;
-(int) maxPathSum: (Node *)n;
-(int) height: (Node *) n;
-(int) successorOfNode: (Node *) n;

@end


#endif /* BSTree_h */
