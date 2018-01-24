//
//  LCYNaviView.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/23.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYNaviView.h"

#define FONT_LEFTLABEL [UIFont fontWithName:@"Helvetica" size:15]
#define FONT_TITLELABEL [UIFont fontWithName:@"Helvetica" size:15]
#define FONT_RIGHTLABEL [UIFont fontWithName:@"Helvetica" size:15]
//导航栏标题颜色
#define COLOR_NAVI_TITLE [UIColor qmui_colorWithHexString:@"#333333"]

@implementation LCYNaviView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self topView];
        [self titleView];
        [self titleLabel];
        [self leftView];
        [self rightView];
    }
    return self;
}

#pragma mark - lazy loading -----------------------

- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor clearColor];
        [self addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
    }
    return _topView;
}

- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 70, 0, SCREEN_WIDTH - 140, 44)];
        [self.topView addSubview:_titleView];
        _titleView.backgroundColor = [UIColor clearColor];
    }
    return _titleView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 140, 44)];
        [self.titleView addSubview:_titleLabel];
        _titleLabel.font = FONT_TITLELABEL;
        _titleLabel.textColor = COLOR_NAVI_TITLE;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
        [self.topView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(self.titleView.mas_left).mas_equalTo(0);
        }];
    }
    return _leftView;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 55, 44)];
        [self.leftView addSubview:_leftLabel];
        _leftLabel.font = FONT_LEFTLABEL;
        _leftLabel.textColor = COLOR_NAVI_TITLE;
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}

- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 11.5, 14, 21)];
        [self.leftView addSubview:_leftImageView];
        _leftImageView.image = [UIImage imageNamed:@"arrowLeft"];
    }
    return _leftImageView;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
        [self.topView addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.titleView.mas_right).mas_equalTo(0);
        }];
    }
    return _rightView;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 55, 44)];
        [self.rightView addSubview:_rightLabel];
        _rightLabel.font = FONT_RIGHTLABEL;
        _rightLabel.textColor = COLOR_NAVI_TITLE;
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}

- (UIImageView *)rightImageView{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(44, 11.5, 14, 21)];
        [self.rightView addSubview:_rightImageView];
    }
    return _rightImageView;
}

#pragma mark - method -----------------------

- (void)showLeft:(LCYLEFTTYPE)type{
    switch (type) {
        case LCYLEFTTYPEONLYTEXT:
        {
            [self leftLabel];
        }
            break;
        case LCYLEFTTYPEONLYIMAGE:
        {
            [self leftImageView];
        }
            break;
        case LCYLEFTTYPEIMAGETEXT:
        {
            self.leftLabel.frame = CGRectMake(30, 0, 40, 44);
        }
            break;
        default:
            break;
    }
}

- (void)showRight:(LCYLEFTTYPE)type{
    switch (type) {
        case LCYLEFTTYPEONLYTEXT:
        {
            [self rightLabel];
        }
            break;
        case LCYLEFTTYPEONLYIMAGE:
        {
            [self rightImageView];
        }
            break;
        case LCYLEFTTYPEIMAGETEXT:
        {
            self.rightLabel.frame = CGRectMake(0, 0, 40, 44);
        }
            break;
        default:
            break;
    }
}

@end
