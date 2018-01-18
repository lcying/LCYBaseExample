//
//  LCYLeftImageTextField.m
//  SMQApp
//
//  Created by 刘岑颖 on 2018/1/12.
//  Copyright © 2018年 lcy. All rights reserved.
//

#import "LCYLeftImageTextField.h"

@implementation LCYLeftImageTextField

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName font:(UIFont *)font textColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = font;
        self.textColor = color;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        CALayer *imageLayer = [CALayer layer];
        imageLayer.backgroundColor = [UIColor clearColor].CGColor;
        imageLayer.contents = (id)[UIImage imageNamed:imageName].CGImage;
        imageLayer.frame = CGRectMake(10, 10, leftView.frame.size.width - 20, leftView.frame.size.width - 20);
        [leftView.layer addSublayer:imageLayer];
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.tintColor = [UIColor redColor];
    }
    return self;
}

@end
