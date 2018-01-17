//
//  SpotsLoadingView.h
//  LCYLoadingAnimationTry1
//
//  Created by 刘岑颖 on 16/12/17.
//  Copyright © 2016年 lcy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotsLoadingView : UIView

@property (nonatomic) CGFloat kSpotRadius;
@property (nonatomic) UIColor *kColor;
@property (nonatomic) CGFloat kRadius;

- (void)startAnimation;
- (void)stopAnimation;

@end
