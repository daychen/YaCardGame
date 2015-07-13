//
//  ViewController.m
//  YaCardGame
//
//  Created by Chen, Ya on 7/10/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property ( nonatomic) int flipcount;


@end

@implementation ViewController

-(void )setFlipcount:(int)flipcount{
    _flipcount=flipcount;
    self.flipsLabel.text=[NSString stringWithFormat:@"flips:%d",self.flipcount];
}


- (IBAction)touchCardButton:(UIButton *)sender {

    if ([sender.currentTitle length]) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        [sender setTitle:@"A♠︎" forState:UIControlStateNormal];
        
      
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
