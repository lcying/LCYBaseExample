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

//lcy
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


#pragma mark --- 创建默认按钮--有字体、颜色--有图片---有背景
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action backImageName:(NSString *)backImageName  {
    
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
    
    // 背景图片
    if (backImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        
        NSString *backHighlighted = [NSString stringWithFormat:@"%@_highlighted", backImageName];
        [button setBackgroundImage:[UIImage imageNamed:backHighlighted] forState:UIControlStateHighlighted];
    }
    // 监听方法
    if (action != nil) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return button;
}
#pragma mark  --- 有文字,有颜色，有字体，有图片，有有背景图片，有边框颜色
+ (instancetype)buttonWithTitle:(NSString *)title
                     titleColor:(UIColor *)titleColor
                           font:(UIFont *)font
                      imageName:(NSString *)imageName
                         target:(id)target
                         action:(SEL)action
                  backImageName:(NSString *)backImageName
                     layerColor:(NSArray *)RGBArr
                    borderWidth:(CGFloat)width
                    CornerRadius:(CGFloat)radius


{
    UIButton *btn = [self buttonWithTitle:title titleColor:titleColor font:font imageName:imageName  target:target action:action backImageName:nil];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:radius]; //设置矩形四个圆角半径
    [btn.layer setBorderWidth:width]; //边框宽度
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    if (RGBArr.count >=3) {
        CGFloat r =[RGBArr[0]floatValue];
        CGFloat g =[RGBArr[1]floatValue];
        CGFloat b =[RGBArr[2]floatValue];
        CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){r/255, g/255, b/255, 1 });
        [btn.layer setBorderColor:colorref];
    }
    
    return btn;
}


#pragma mark  --- 有文字,有颜色，有字体，有图片，没有背景图片
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action {
    return [self buttonWithTitle:title titleColor:titleColor font:font imageName:imageName  target:target action:action backImageName:nil];
}


#pragma mark  --- 有文字,有颜色，有字体，没有图片，没有背景
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action {
    return [self buttonWithTitle:title titleColor:titleColor font:font imageName:nil target:target action:action backImageName:nil];
}

#pragma mark  --- 有文字,有颜色,有字体,没图片，有背景
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action backImageName:(NSString *)backImageName {
    return [self buttonWithTitle:title titleColor:titleColor font:font imageName:nil target:target action:action backImageName:backImageName];
}

@end
