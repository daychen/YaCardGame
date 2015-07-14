//
//  CardMatchingGame.h
//  YaCardGame
//
//  Created by YA CHEN on 13/7/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject


-(instancetype)initWithCardCount:(NSUInteger) count usingDeck:(Deck*) deck;



-(void)chooseCardAtIndex:(NSUInteger) index;
-(Card *)cardAtIndex:(NSUInteger)index;


@property(nonatomic,readonly) NSUInteger score;
@property(nonatomic)NSUInteger maxMatchingCard;

@end
