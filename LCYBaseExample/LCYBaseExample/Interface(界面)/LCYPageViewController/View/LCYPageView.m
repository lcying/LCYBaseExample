//
//  LCYPageView.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYPageView.h"
#import "LCYHeadTitlesView.h"

@interface LCYPageView ()

@property (nonatomic, strong) LCYHeadTitlesView *headTitlesView;
@property (nonatomic, strong) UIScrollView *contentScrollView;

@end

@implementation LCYPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self headTitlesView];
        [self contentScrollView];
        
        [self.headTitlesView setLCYCurrentHeadTitlesChangedCallBack:^(NSInteger index) {
            
        }];
    }
    return self;
}

- (LCYHeadTitlesView *)headTitlesView{
    if (!_headTitlesView) {
        _headTitlesView = [[LCYHeadTitlesView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) andTitles:@[@"标题1",@"标题2",@"标题3"]];
        [self addSubview:_headTitlesView];
    }
    return _headTitlesView;
}

- (UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 40)];
        [self addSubview:_contentScrollView];
    }
    return _contentScrollView;
}

@end
