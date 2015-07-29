//
//  SetCard.h
//  YaCardGame
//
//  Created by Chen, Ya on 7/28/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "Card.h"


@interface PlayingSet : Card



@property (nonatomic) NSInteger symbolNumber;
@property(nonatomic, strong)NSString* symbolColor;
@property(nonatomic,strong)NSString* symbolShading;
@property(nonatomic)NSString* symbolType;



@end
