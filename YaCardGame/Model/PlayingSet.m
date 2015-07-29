//
//  SetCard.m
//  YaCardGame
//
//  Created by Chen, Ya on 7/28/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingSet.h"

@implementation PlayingSet


-(instancetype)init{
    self=[super init];
    
    if (self) {
        self.symbolColor=[PlayingSet availableColorSet][[self drawRandomSymbol]];
        self.symbolNumber=[self drawRandomSymbol]+1;
        self.symbolShading=[PlayingSet availableShadingSet][[self drawRandomSymbol]];
        self.symbolType=[PlayingSet availableTypeSet][[self drawRandomSymbol]];
        
    }
    
    return self;
}


-(int)drawRandomSymbol{
    return arc4random()%3;
    
}

-(void)SetSymbolColor:(NSString*)symbolcolor{
    if ([[PlayingSet availableColorSet] containsObject:_symbolColor ]) {
        
        _symbolColor=symbolcolor;
    }
}


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
    
    return [NSString stringWithFormat:@"%ld %@ %@ %@",self.symbolNumber,self.symbolColor,self.symbolShading,self.symbolType ];

}

-(int)match:(NSArray *)otherCards{
    
    int score=0;
    
    
    //
    
    return score;

}

@end
