//
//  Node.h
//  LinkedList
//
//  Created by Simon Lam on 10/9/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#ifndef Node_h
#define Node_h
@interface Node<ObjectType>: NSObject

@property int item;
@property Node *left;
@property Node *right;


-(id) initWithItem: (int) f;
@end
#endif /* Node_h */
