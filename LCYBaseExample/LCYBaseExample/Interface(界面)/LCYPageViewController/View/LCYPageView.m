//
//  LCYPageView.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYPageView.h"
#import "LCYHeadTitlesView.h"

@interface LCYPageView () <UIScrollViewDelegate>

@property (nonatomic, strong) LCYHeadTitlesView *headTitlesView;
@property (nonatomic, strong) NSArray *headTitlesArray;

@end

@implementation LCYPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.headTitlesArray = @[@"标题1",@"标题2",@"标题3"];
        //导航栏
        [self.topBarView setTitle:@"测试"];
        [self.topBarView showLeft:LCYLEFTTYPEIMAGETEXT];
        self.topBarView.leftLabel.text = @"左";
        [self.topBarView showRight:LCYLEFTTYPEIMAGETEXT];
        self.topBarView.rightLabel.text = @"右";

        [self headTitlesView];
        [self contentScrollView];

        @WeakObj(self);
        [self.headTitlesView setLCYCurrentHeadTitlesChangedCallBack:^(NSInteger index) {
            @StrongObj(self);
            
            self.contentScrollView.contentOffset = CGPointMake(index * SCREEN_WIDTH, 0);
        }];
    }
    return self;
}

- (LCYHeadTitlesView *)headTitlesView{
    if (!_headTitlesView) {
        _headTitlesView = [[LCYHeadTitlesView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, 40) andTitles:self.headTitlesArray];
        [self addSubview:_headTitlesView];
        [_headTitlesView setLineViewHidden:YES];
    }
    return _headTitlesView;
}

- (UIScrollView *)contentScrollView{
    if (!_contentScrollView) {
        _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight + 40, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 40)];
        _contentScrollView.backgroundColor = [UIColor redColor];
        [self addSubview:_contentScrollView];
        _contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.headTitlesArray.count, SCREEN_HEIGHT - SafeAreaTopHeight - 40);
        _contentScrollView.showsHorizontalScrollIndicator = NO;
        _contentScrollView.pagingEnabled = YES;
        _contentScrollView.delegate = self;
    }
    return _contentScrollView;
}

#pragma mark - delegate -----------------------

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    [self.headTitlesView setSelectedIndex:index];
}

@end
