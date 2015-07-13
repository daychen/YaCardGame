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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property ( nonatomic) int flipcount;
@property (strong,nonatomic) Deck *deck;

@end


@implementation ViewController

-(Deck *)deck{
    if (!_deck) {
        _deck=[[PlayingCardDeck alloc]init];
    }
    
    return _deck;

}

-(void )setFlipcount:(int)flipcount{
    _flipcount=flipcount;
    self.flipsLabel.text=[NSString stringWithFormat:@"flips:%d",self.flipcount];
}


- (IBAction)touchCardButton:(UIButton *)sender {

    if ([sender.currentTitle length]) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    
    }else{
        
        Card *flipCard=[self.deck drawRandomCard];
        
        if (flipCard) {
            
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            
            
            [sender setTitle:[NSString stringWithFormat:@"%@",flipCard.contents] forState:UIControlStateNormal];
        }
        
      
    }
    
    self.flipcount++;
    
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
