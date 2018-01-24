//
//  LCYBaseView.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYBaseView.h"

@interface LCYBaseView ()

@property (nonatomic, strong) UILabel *noDataLabel;

@end


@implementation LCYBaseView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self noDataLabel];
    }
    return self;
}

- (LCYNaviView *)topBarView{
    if (!_topBarView) {
        _topBarView = [[LCYNaviView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SafeAreaTopHeight)];
        [self addSubview:_topBarView];
    }
    return _topBarView;
}

- (UILabel *)noDataLabel{
    if (!_noDataLabel) {
        _noDataLabel = [[UILabel alloc] initWithFont:FONT_MAIN textColor:COLOR_MAINTEXT];
        [self addSubview:_noDataLabel];
        [_noDataLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(0);
        }];
        _noDataLabel.text = @"暂无数据";
        _noDataLabel.textAlignment = NSTextAlignmentCenter;
        _noDataLabel.hidden = YES;
    }
    return _noDataLabel;
}

#pragma mark - Methods --------------

- (void)showNoDataView{
    self.noDataLabel.hidden = NO;
}

- (void)hideNoDataView{
    self.noDataLabel.hidden = YES;
}

@end
