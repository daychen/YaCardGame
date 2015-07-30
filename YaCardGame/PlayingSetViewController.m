//
//  SetViewController.m
//  YaCardGame
//
//  Created by YA CHEN on 29/7/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingSetViewController.h"

#import "PlayingSetDeck.h"
#import "PlayingSet.h"

#import "PlayingSetView.h"

@interface PlayingSetViewController ()

@property(nonatomic, strong)PlayingSetDeck *deck;



@property (strong, nonatomic) IBOutletCollection(PlayingSetView) NSArray *playingSetCards;

@end

@implementation PlayingSetViewController

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


static const int PLAYINGSETGAME_CARDCOUNT =12;
-(PlayingSetDeck *)deck{
    if (!_deck) {
        _deck=[[PlayingSetDeck alloc]initWithCount:PLAYINGSETGAME_CARDCOUNT];
    }
    return _deck;
}

-(NSArray *)playingSetCards{
    if (!_playingSetCards) {
        _playingSetCards=[[NSArray alloc]init];
    }
    
    return _playingSetCards;
}

-(void)addCardContents{
    
    for (PlayingSetView *playingSetCard in self.playingSetCards ) {
        
        
        PlayingSet *oneCard=[[PlayingSet alloc]init];
 
        
        
        playingSetCard.symbolColor=oneCard.symbolColor;
        playingSetCard.symbolCount=oneCard.symbolNumber;
        playingSetCard.symbolShading=oneCard.symbolShading;
        playingSetCard.symbolShape=oneCard.symbolType;
    }
    
    
        
    

}




-(void)viewDidLoad{
    
     [super viewDidLoad];
   [self addCardContents];
    

    
    
    
    
//       self.oneSingelSetCardView.symbolColor=@"red";
//        self.oneSingelSetCardView.symbolCount=3;
//        self.oneSingelSetCardView.symbolShading=@"empty";
//       self.oneSingelSetCardView.symbolShape=@"circle";
}

@end
