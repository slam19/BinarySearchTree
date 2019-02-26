//
//  Node.m
//  LinkedList
//
//  Created by Simon Lam on 10/9/18.
//  Copyright © 2018 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@implementation Node
-(id) init{
    self = [super init];
    if (self){
        self.item = 1;
        self.next = nil;
    }
    return self;
}

-(id) initWithItem: (int) i{
    self = [super init];
    if (self){
        self.item = i;
        self.next = nil;
    }
    return self;
}


@end
