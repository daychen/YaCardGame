//
//  SetView.m
//  YaCardGame
//
//  Created by YA CHEN on 29/7/15.
//  Copyright (c) 2015 Chen, Ya. All rights reserved.
//

#import "PlayingSetView.h"

@implementation PlayingSetView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/

#pragma mark -drawCard
#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0


-(CGFloat)cornerScaleFactor {
    return self.bounds.size.height/CORNER_FONT_STANDARD_HEIGHT;
}
-(CGFloat)cornerRadius{
    return CORNER_RADIUS*[self cornerScaleFactor];
}
-(CGFloat)cornerOffset{
    return [self cornerRadius]/3.0;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    
    UIBezierPath *cardBorderPath=[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [cardBorderPath addClip];
    [[UIColor whiteColor]setFill];
    UIRectFill(self.bounds);
    
    
    
    NSMutableParagraphStyle *cornerStyle=[[NSMutableParagraphStyle alloc]init];
    cornerStyle.alignment=NSTextAlignmentCenter;
    
    UIFont *cornerFont=[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont=[cornerFont fontWithSize:cornerFont.pointSize*[self cornerScaleFactor]];
    
    
    
    NSAttributedString *textContent=[[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%ld%@%@%@",self.symbolCount,self.symbolColor,self.symbolShading,self.symbolShape] attributes:@{NSFontAttributeName:cornerFont,NSParagraphStyleAttributeName:cornerStyle}];
    
    
    CGRect textBounds;
    textBounds.origin=CGPointMake([self cornerOffset], [self cornerOffset]);
    
    
    
    textBounds.size=textContent.size;
    
    [textContent drawInRect:textBounds];
    
    
    [self drawRoundRectSymbol:self.symbolCount];
        
    
}



-(void)drawRoundRectSymbol: (int)count{
    
    if ([self.symbolShape isEqualToString:@"square"]) {
        
        
        
       
        CGRect roundRectSymbol=CGRectMake(10, 15, 15, 40);
        CGFloat radius=10;
        UIBezierPath *roundRectPath=[UIBezierPath bezierPathWithRoundedRect:roundRectSymbol cornerRadius:radius];
        [roundRectPath addClip];
        [[self colorFromString:self.symbolColor ] setFill];
        
        UIRectFill(roundRectSymbol);
        
        
    }
    
    if ([self.symbolShape isEqualToString:@"diamond"]) {
        
        
        
        UIBezierPath *diamondpath=[UIBezierPath bezierPath];
        [diamondpath moveToPoint:CGPointMake(20,10)];
        [diamondpath addLineToPoint:CGPointMake(30, 35)];
        [diamondpath addLineToPoint:CGPointMake(20, 60)];

        [diamondpath addLineToPoint:CGPointMake(10, 35)];
        [diamondpath closePath];
        
        [[self colorFromString:self.symbolColor] setFill];

        [diamondpath fill];
        
        
    }
    
    if ([self.symbolShape isEqualToString:@"circle"]) {
        
        
        
        UIBezierPath *curvePath=[UIBezierPath bezierPath];
        [curvePath moveToPoint:CGPointMake(30,20)];
        [curvePath addCurveToPoint:CGPointMake(40,60 ) controlPoint1:CGPointMake(50, 30) controlPoint2:CGPointMake(10, 50)];
     
       // curvePath.lineWidth=2;
        
        
        
        [[self colorFromString:self.symbolColor] setStroke];
        
         [curvePath stroke];

       UIBezierPath *curvePath2=[UIBezierPath bezierPath];
        [curvePath2 moveToPoint:CGPointMake(40,20)];
       [curvePath2 addCurveToPoint:CGPointMake(40,50 ) controlPoint1:CGPointMake(55, 32) controlPoint2:CGPointMake(38, 40)];
//        
        
        
        [curvePath2 stroke];
        
    }
    

}

-(UIColor *)colorFromString:(NSString *)colorname{

    SEL shapeColor=NSSelectorFromString(colorname);
    
    UIColor *color=[UIColor performSelector:shapeColor];
    
    return  color;

}


-(void) setup{
    
    self.backgroundColor=nil;
    self.opaque=NO;
    self.contentMode=UIViewContentModeRedraw;
}
-(void)awakeFromNib{
    [self setup];
}


@end
