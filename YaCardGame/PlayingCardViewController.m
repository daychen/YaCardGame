//
//  ViewController.m
//  YaCardGame
//
//  Created by Chen, Ya on 7/10/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"
@interface PlayingCardViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *CardButtons;


@property (strong,nonatomic) Deck *deck;

@property (strong,nonatomic)CardMatchingGame *cardGame;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSelector;
@property (weak, nonatomic) IBOutlet UILabel *chooseResultLabel;

@end


@implementation PlayingCardViewController


- (IBAction)chooseModeSegment:(UISegmentedControl *)sender {
    
    self.cardGame.maxMatchingCard=[[sender titleForSegmentAtIndex:[sender selectedSegmentIndex]] integerValue];
    
}

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
      
        [self chooseModeSegment:self.modeSelector];
    }
    
    return _cardGame;
}


- (IBAction)resetButton:(UIButton *)sender {
    
    self.cardGame=nil;
    [self updateUI];
    
    self.modeSelector.enabled=YES;
    
}


- (IBAction)touchCardButton:(UIButton *)sender {

    NSInteger cardIndex=[self.CardButtons indexOfObject:sender];
    
    [self.cardGame chooseCardAtIndex:cardIndex];
    
    [self updateUI];
    self.modeSelector.enabled=NO;
    
}



-(void)updateUI{

    for (UIButton *button in self.CardButtons) {
        int cardIndex=[self.CardButtons indexOfObject:button];
        
        Card *card=[self.cardGame cardAtIndex:cardIndex];
        
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        
        button.enabled =!card.matched;
        
    }
    
    self.scoreLabel.text=[NSString stringWithFormat:@"Score: %ld",self.cardGame.score];
    self.chooseResultLabel.text=self.cardGame.lastChooseResult;
    
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
