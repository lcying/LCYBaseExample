//
//  TestViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/22.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "TestViewController.h"
#import "SettingViewController.h"
#import "HCSStarRatingView.h"

@interface TestViewController ()

@property (nonatomic, strong) HCSStarRatingView *starView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 50)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    
    
    [self starView];
}

- (void)buttonClickedAction{
    SettingViewController *vc = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (HCSStarRatingView *)starView{
    if (!_starView) {
        _starView = [[HCSStarRatingView alloc] initWithFrame:CGRectMake(20, 70, SCREEN_WIDTH - 40, 50)];
        [self.view addSubview:_starView];
        _starView.maximumValue = 5;//最多星星数
        _starView.minimumValue = 0.5;//最少选中星星数
        _starView.allowsHalfStars = YES;//是否允许半颗星星显示
        _starView.accurateHalfStars = YES;//是否连续显示星星
//        _starView.continuous = YES;
        _starView.starBorderColor = [UIColor redColor];//星星边框颜色
        _starView.starBorderWidth = 1.0;//星星边框宽度
        _starView.emptyStarColor = [UIColor lightGrayColor];//未选中星星的填充色
        _starView.tintColor = [UIColor greenColor];//选中星星的填充色
        _starView.backgroundColor = [UIColor clearColor];
        _starView.value = 4.0;//当前值
    }
    return _starView;
}

@end
