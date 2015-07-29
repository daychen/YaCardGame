//
//  SetCardDeck.m
//  YaCardGame
//
//  Created by YA CHEN on 29/7/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingSetDeck.h"
#import "PlayingSet.h"

@implementation PlayingSetDeck




-(instancetype)initWithCount:(int)count{
    self=[super init];
    int index=0;
    
    if (self) {
        
        while (index<count) {
            
            PlayingSet *singleSetCard=[[PlayingSet alloc]init];
            [self addCard:singleSetCard];
            
        }
    }
    
    
    return self;
}
@end
