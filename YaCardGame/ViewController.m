//
//  ViewController.m
//  YaCardGame
//
//  Created by Chen, Ya on 7/10/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;


@property (strong,nonatomic) Deck *deck;

@property (strong,nonatomic)CardMatchingGame *cardGame;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end


@implementation ViewController

-(Deck *)deck{
    if (!_deck) {
        _deck=[self createDeck];
    }
    
    return _deck;

}
-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}

-(CardMatchingGame *)cardGame{
    if (!_cardGame) {
        _cardGame=[[CardMatchingGame alloc]initWithCardCount:[self.CardButtons count] usingDeck:[self createDeck]];
    }
    
    return _cardGame;
}




- (IBAction)touchCardButton:(UIButton *)sender {

    int cardIndex=[self.CardButtons indexOfObject:sender];
    
    [self.cardGame chooseCardAtIndex:cardIndex];
    
    [self updateUI];
    
}

-(void)updateUI{

    for (UIButton *button in self.CardButtons) {
        int cardIndex=[self.CardButtons indexOfObject:button];
        
        Card *card=[self.cardGame cardAtIndex:cardIndex];
        
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        
        button.enabled =!card.matched;
        
    }
    
    self.scoreLabel.text=[NSString stringWithFormat:@"Score: %d",self.cardGame.score];
}


-(NSString *)titleForCard:(Card *)card{
    return (card.isChosen)? card.contents: @"";
    
}

-(UIImage *)imageForCard:(Card *)card{
    return [UIImage imageNamed:(card.isChosen)? @"cardfront" : @"cardback"];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
