//
//  CardMatchingGame.m
//  YaCardGame
//
//  Created by YA CHEN on 13/7/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite)NSUInteger score;

@property(nonatomic, strong)NSMutableArray *cards;
@end

@implementation CardMatchingGame


-(NSMutableArray *)cards{
    if (!_cards) {
        _cards=[[NSMutableArray alloc]init];
    }
    
    return  _cards;
}


-(NSUInteger)maxMatchingCard{
    if (_maxMatchingCard <=2) {
        _maxMatchingCard=2;
    }
    return _maxMatchingCard;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*) deck
{
    self=[super init];
    
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card=[deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];

            }else{
                self=nil;
                break;
                
            }
        }
    }
    
    return  self;

}

-(Card *)cardAtIndex:(NSUInteger)index{
   
    return index<[self.cards count ]? self.cards[index]: nil;

}

static const int MISMATCH_PERNATY=2;
static const int MATCH_BONUS= 4;
static const int COST_TO_CHOOSE= 1;

-(void) chooseCardAtIndex:(NSUInteger)index{
    Card *card=[self cardAtIndex:index];
    
    if (!card.isMatched) {
        
        if (card.isChosen) {
            card.chosen=NO;
        }else{
            
            NSMutableArray *otherCards=[[NSMutableArray alloc]init];
            for (Card *otherCard in self.cards) {
                if ((otherCard.isChosen) && (!otherCard.isMatched) ){
                    
                    [otherCards addObject:otherCard];
                }
            }
            
                    if ([otherCards count]+1==self.maxMatchingCard) {
                        
                    
                        int matchScore=[card match:otherCards];
                        
                        if (matchScore) {
                            self.score+=matchScore*MATCH_BONUS;
                            card.matched=YES;
                            for (Card *newCard in otherCards ) {
                                  newCard.matched=YES;
                            }
                          
                            
                        }else{
                            self.score-=MISMATCH_PERNATY;
                           
                            for (Card *newCard in otherCards) {
                                newCard.chosen=NO;
                            }
                            
                        }
                        
                
                        
                    
                    }
                    
            
                
                
            
            
            
            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;
        }
        
        
    }else{
    
    }

}




@end
