//
//  LCYNaviView.h
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/23.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LCYLEFTTYPEONLYIMAGE,//只有图片
    LCYLEFTTYPEONLYTEXT,//只有文字
    LCYLEFTTYPEIMAGETEXT,//图片+文字
} LCYLEFTTYPE;

@interface LCYNaviView : UIView

//顶栏
@property (nonatomic) UIView *topView;
//标题view
@property (nonatomic) UIView *titleView;
//标题Label
@property (nonatomic) UILabel *titleLabel;
//顶栏左侧view
@property (nonatomic) UIView *leftView;
//顶栏左侧view中icon
@property (nonatomic) UIImageView *leftImageView;
//顶栏左侧view中text
@property (nonatomic) UILabel *leftLabel;
//顶栏右侧view
@property (nonatomic) UIView *rightView;
//顶栏右侧view中icon
@property (nonatomic) UIImageView *rightImageView;
//顶栏右侧view中text
@property (nonatomic) UILabel *rightLabel;
//导航栏底部的线
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) void(^LeftClickCallBack) (void);

@property (nonatomic, strong) void(^RightClickCallBack) (void);

/**
 * 设置左视图
 */
- (void)showLeft:(LCYLEFTTYPE)type;

/**
 * 设置右视图
 */
- (void)showRight:(LCYLEFTTYPE)type;

/**
 * 设置标题
 */
- (void)setTitle:(NSString *)title;

/**
 * 设置左侧点击pop
 */
- (void)leftClickPop;

@end
