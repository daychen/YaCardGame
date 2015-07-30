//
//  SetCardDeck.h
//  YaCardGame
//
//  Created by YA CHEN on 29/7/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "Deck.h"
#import "PlayingSet.h"

@interface PlayingSetDeck : Deck

-(instancetype)initWithCount:(NSInteger)count;
-(PlayingSet *)drawOneSetCard;

@end
