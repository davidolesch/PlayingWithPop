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

- (IBAction)touchedButton:(UIButton *)sender
{
    //choose new width of square
    float squareSide = sender.frame.size.width == 200.f ? 300.f : 200.f;
    
    //animate bounds
    POPSpringAnimation *boundsAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(0.f, 0.f, squareSide, squareSide)];
    [sender pop_addAnimation:boundsAnim forKey:kPOPLayerBounds];
}

- (IBAction)viewDragged:(UIPanGestureRecognizer *)panGesture
{
    if (panGesture.state == UIGestureRecognizerStateEnded) {
        //rotate to 0 radians
        POPBasicAnimation *rotationAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationY];
        rotationAnim.duration = 0.5;
        rotationAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        rotationAnim.toValue = @(0);
        [panGesture.view.layer pop_addAnimation:rotationAnim forKey:kPOPLayerRotationY];

    }
    else {
        //rotate view based on pan gesture translation
        CGPoint translation = [panGesture translationInView:self.containerView];
        panGesture.view.layer.transform = CATransform3DMakeRotation(translation.x/100,0.0,1.0,0.0);
    }
}

@end
