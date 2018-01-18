//
//  SettingView.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "SettingView.h"
#import "LCYNormalTVCell.h"

@interface SettingView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *contentTableView;

@end

@implementation SettingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self contentTableView];
    }
    return self;
}

- (UITableView *)contentTableView{
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight) style:UITableViewStylePlain];
        [self addSubview:_contentTableView];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
        _contentTableView.backgroundColor = [UIColor clearColor];
        _contentTableView.tableFooterView = [UIView new];
        [_contentTableView registerClass:[LCYNormalTVCell class] forCellReuseIdentifier:@"LCYNormalTVCell"];
    }
    return _contentTableView;
}

#pragma mark - UITableViewDelegate -----------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCYNormalTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LCYNormalTVCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[LCYNormalTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LCYNormalTVCell"];
    }
    [cell setType:LCYNormalTVCellTypeImageTitleArrow];
    
    [cell setImage:@"placeholderImage"];
    [cell setTitle:@"左标题"];
    [cell setDetail:@"detaildetail"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

@end
