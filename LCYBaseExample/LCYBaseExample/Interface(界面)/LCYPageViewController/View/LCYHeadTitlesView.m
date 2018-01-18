//
//  LCYHeadTitlesView.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYHeadTitlesView.h"

#define headTitlesnNormalFont [UIFont systemFontOfSize:14]
#define headTitlesnNormalColor [UIColor qmui_colorWithHexString:@"#333333"]
#define headTitlesSelectedColor [UIColor redColor]
#define headTitlesLineViewColor [UIColor redColor]
static CGFloat HeadTitlesButtonLeftRightMargin = 70;//按钮距离self的左右边距

@interface LCYHeadTitlesView ()

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, assign) CGFloat buttonWidth;
@property (nonatomic, strong) NSMutableArray *buttonsArray;

@end

@implementation LCYHeadTitlesView

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titlesArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonWidth = (SCREEN_WIDTH - HeadTitlesButtonLeftRightMargin * 2) / titlesArray.count;
        self.buttonsArray = [NSMutableArray array];
        for (int i = 0; i < titlesArray.count; i ++) {
            QMUIButton *button = [[QMUIButton alloc] initWithFrame:CGRectMake(HeadTitlesButtonLeftRightMargin + _buttonWidth * i, 0, _buttonWidth, frame.size.height)];
            [button setTitle:titlesArray[i] forState:UIControlStateNormal];
            [button setTitleColor:headTitlesnNormalColor forState:UIControlStateNormal];
            [button setTitleColor:headTitlesSelectedColor forState:UIControlStateSelected];
            button.titleLabel.font = headTitlesnNormalFont;
            button.tag = 10 + i;
            button.selected = NO;
            if (i == 0) {
                button.selected = YES;
            }
            [button addTarget:self action:@selector(buttonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttonsArray addObject:button];
            [self addSubview:button];
        }
        self.lineView = [[UIView alloc] initWithFrame:CGRectMake(HeadTitlesButtonLeftRightMargin, frame.size.height - 2, _buttonWidth, 1)];
        [self addSubview:_lineView];
        self.lineView.backgroundColor = headTitlesLineViewColor;
    }
    return self;
}

- (void)buttonClickedAction:(QMUIButton *)button{
    NSInteger index = button.tag - 10;
    _LCYCurrentHeadTitlesChangedCallBack(index);
    for (QMUIButton *btn in self.buttonsArray) {
        btn.selected = NO;
    }
    button.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = CGRectMake(HeadTitlesButtonLeftRightMargin + _buttonWidth * index, self.frame.size.height - 2, _buttonWidth, 1);
        self.lineView.frame = frame;
    }];
}

#pragma mark - method -----------------------

- (void)setLineViewHidden:(BOOL)hidden{
    self.lineView.hidden = hidden;
}

@end
