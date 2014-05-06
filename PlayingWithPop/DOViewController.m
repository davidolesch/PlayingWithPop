//
//  DOViewController.m
//  PlayingWithPop
//
//  Created by David Olesch on 5/1/14.
//  Copyright (c) 2014 David Olesch. All rights reserved.
//

#import "DOViewController.h"
#import <POP/POP.h>

@implementation DOViewController

- (IBAction)touchedButton:(UIButton *)sender {
    //choose new width of square
    float squareSide = sender.frame.size.width == 200.f ? 300.f : 200.f;
    
    //animate bounds
    POPSpringAnimation *boundsAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(0.f, 0.f, squareSide, squareSide)];
    [sender pop_addAnimation:boundsAnim forKey:kPOPLayerBounds];
}

@end
