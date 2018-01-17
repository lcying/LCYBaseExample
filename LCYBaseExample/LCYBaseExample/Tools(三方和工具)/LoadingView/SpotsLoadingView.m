//
//  SpotsLoadingView.m
//  LCYLoadingAnimationTry1
//
//  Created by 刘岑颖 on 16/12/17.
//  Copyright © 2016年 lcy. All rights reserved.
//

#import "SpotsLoadingView.h"

@interface SpotsLoadingView ()<CAAnimationDelegate>

@end

@implementation SpotsLoadingView

- (void)startAnimation{
    [self doStepOne];
}

- (void)stopAnimation{
    self.layer.opacity = 0.0;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(1.0);
    animation.toValue = @(0);
    animation.duration = 0.3;
    animation.delegate = self;
    [animation setValue:@"step1" forKey:@"name"];
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)doStepOne{
    CGPoint center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    float pai = 0.0;
    float alpha = 0.0;
    for (int i = 0; i < 8; i ++) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.contentsScale = [UIScreen mainScreen].scale;
        [self.layer addSublayer:shapeLayer];
        
        shapeLayer.bounds = CGRectMake(0, 0, self.kRadius*2 + self.kSpotRadius*4, self.kRadius*2 + self.kSpotRadius*4);
        shapeLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];

        alpha = alpha + i/8.0;
        pai = i*M_PI_2/2;
        [bezierPath moveToPoint:CGPointMake(center.x + cos(pai)*self.kRadius, center.y + sin(pai)*self.kRadius)];
        [bezierPath addArcWithCenter:CGPointMake(center.x + cos(pai)*self.kRadius, center.y + sin(pai)*self.kRadius) radius:self.kSpotRadius startAngle:0 endAngle:M_PI*2 clockwise:YES];
        
        shapeLayer.path = bezierPath.CGPath;
        shapeLayer.strokeColor = nil;
        shapeLayer.fillColor = self.kColor.CGColor;
        shapeLayer.opacity = alpha;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(M_PI*2);
    animation.duration = 2.0;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = NO;
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([[anim valueForKey:@"name"] isEqualToString:@"step1"]) {
        [self removeFromSuperview];
    }
}

@end
