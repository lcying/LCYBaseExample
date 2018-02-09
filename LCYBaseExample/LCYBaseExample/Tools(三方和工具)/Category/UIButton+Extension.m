//
//  UIButton+Extension.m
//  Weibo11
//
//  Created by JYJ on 15/12/5.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "UIButton+Extension.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic) void(^callBack) (id obj);

@end

@implementation UIButton (Extension)

- (void (^)(id))callBack{
    return objc_getAssociatedObject(self, @selector(callBack));
}

- (void)setCallBack:(void (^)(id))callBack{
    objc_setAssociatedObject(self, @selector(callBack), callBack, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)didClickAction:(UIButton *)button{
    self.callBack(button);
}

- (instancetype)initWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andFontSize:(CGFloat)fontSize andImageName:(NSString *)imageName andBackImageName:(NSString *)backImageName andCallBack:(void (^)(UIButton *))callBack{
    self = [super init];
    if (self) {
        // 设置标题
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        self.adjustsImageWhenHighlighted = NO;
        
        // 图片
        if (imageName != nil) {
            [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
            NSString *highlighted = [NSString stringWithFormat:@"%@_highlighted", imageName];
            [self setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
        }
        
        // 背景图片
        if (backImageName != nil) {
            [self setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
            NSString *backHighlighted = [NSString stringWithFormat:@"%@_highlighted", backImageName];
            [self setBackgroundImage:[UIImage imageNamed:backHighlighted] forState:UIControlStateHighlighted];
        }
        
        //点击事件
        self.callBack = callBack;
        [self addTarget:self action:@selector(didClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc] init];
    // 设置标题
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.adjustsImageWhenHighlighted = NO;
    // 图片
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        NSString *highlighted = [NSString stringWithFormat:@"%@_highlighted", imageName];
        [button setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    }
    // 监听方法
    if (action != nil) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}


+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName {
    UIButton *button = [[UIButton alloc] init];
    // 设置标题
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.adjustsImageWhenHighlighted = NO;
    // 图片
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        NSString *highlighted = [NSString stringWithFormat:@"%@_highlighted", imageName];
        [button setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    }
    return button;
}


+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc] init];
    // 设置标题
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.adjustsImageWhenHighlighted = NO;
    // 监听方法
    if (action != nil) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}

@end
