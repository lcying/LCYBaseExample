//
//  UIButton+Extension.h
//  Weibo11
//
//  Created by JYJ on 15/12/5.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

/**
 *  创建按钮
 *
 *  @param title         标题
 *  @param titleColor    字体颜色
 *  @param fontSize      字号
 *  @param imageName     图像
 *  @param backImageName 背景图像
 *  @param callBack      点击事件
 *
 *  @return UIButton
 */
- (instancetype)initWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andFontSize:(CGFloat)fontSize andImageName:(NSString *)imageName andBackImageName:(NSString *)backImageName andCallBack:(void (^)(UIButton *))callBack;


/**
 *  创建按钮
 *
 *  @param title         标题
 *  @param titleColor    字体颜色
 *  @param font          字号
 *  @param imageName     图像
 *  @param target        目标对象
 *  @param action        点击事件
 *
 *  @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName target:(id)target action:(SEL)action;

/**
 *  创建按钮
 *
 *  @param title         标题
 *  @param titleColor    字体颜色
 *  @param font          字号
 *  @param imageName     图像
 *
 *  @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font imageName:(NSString *)imageName;


/**
 *  创建按钮
 *
 *  @param title         标题
 *  @param titleColor    标题颜色
 *  @param font          字号
 *
 *  @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;


@end
