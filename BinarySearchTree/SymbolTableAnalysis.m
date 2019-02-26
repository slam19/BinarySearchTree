//
//  SymbolTableAnalysis.m
//  BinarySearchTree
//
//  Created by Simon Lam on 2/22/19.
//  Copyright © 2019 Simon Lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "SymbolTableAnalysis.h"

@implementation SymbolTableAnalysis

-(void) compareRunTime{
    self.N = 1000; //change N value here
    self.myTree = [[BSTree alloc] init];
    self.BSArray =(int *)malloc(sizeof(int)*self.N);
    
    CFTimeInterval startTime = CACurrentMediaTime();
    for(int i = 0; i<self.N; i++){
        [self.myTree insert: arc4random_uniform(self.N)];
    }
    CFTimeInterval elapsedTime = CACurrentMediaTime() - startTime;
    printf("Time taken to construct tree: %f \n", elapsedTime);
    
    
    CFTimeInterval startTime2 = CACurrentMediaTime();
    for(int i = 0; i<self.N; i++){
        self.key = arc4random_uniform(self.N);
        int index = [self getIndexInArray:0 and:i];
        [self resizeArrayFromIndex:index withSize: i];
    }
    CFTimeInterval elapsedTime2 = CACurrentMediaTime() - startTime2;
    printf("Time taken to construct BS array: %f \n", elapsedTime2);
    
    printf("Ratio: %f", elapsedTime2/elapsedTime);
}

-(void) resizeArrayFromIndex: (int) index withSize: (int) size{ //resize to fit an additional key.
    int  *a2;
    a2 = (int *)malloc(sizeof(int)*(size+1));
    
    for(int i =0; i<index; i++){ //shift tail down
        a2[i]=self.BSArray[i];
    }
    
    a2[index] = self.key;
    
    for(int i =index+1; i<size+1; i++){
        a2[i]=self.BSArray[i-1];
    }
    
    self.BSArray = a2;
    
}

-(int) getIndexInArray: (int) left and: (int) right{ //Binary Search method to compute index of integer to be added.
    if (right>=left) {
        int middle = left+(right-left)/2;
        int upperVal = self.BSArray[middle];
        
        if(middle ==0){
            if(self.key > upperVal ){
                return 1;
            }
            return 0;
        }
        
        int lowerVal= self.BSArray[middle-1];
        
        if(self.key > upperVal && middle == self.N-1){
            return middle;
        }
        if (self.key == upperVal ||(self.key > lowerVal && self.key< upperVal)){
            return middle;
        }
        
        if(self.key == lowerVal || self.key<self.BSArray[0]){
            return middle-1;
        }
        
        if (self.key<lowerVal){
            return [self getIndexInArray:left and: middle-1];
        }
        if(self.key >upperVal){
            return [self getIndexInArray:middle+1 and:right];
        }
        
    }else{
        return left; //if index is last in array.
    }
    return -1;
}


@end
