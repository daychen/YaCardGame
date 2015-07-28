//
//  SetCard.m
//  YaCardGame
//
//  Created by Chen, Ya on 7/28/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


+(NSArray *) availableColorSet{
    
    return @[@"red",@"blue",@"yellow"];

}

+(NSArray *) availableTypeSet{
    
  
    return @[@"diamond",@"square",@"circle"];
    
}

+(NSArray *) availableShadingSet{
    
    return @[@"striped",@"solid",@"open"];
    
}



-(NSString*)contents{
    
    return [NSString stringWithFormat:@"%ld %@ %@ %@",self.symbolNumber,self.symbolColor,self.symbolShading,[SetCard availableTypeSet][self.symbolNumber] ];

}

-(int)match:(NSArray *)otherCards{
    
    int score=0;
    
    
    //
    
    return score;

}

@end
