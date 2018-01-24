//
//  TestViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/22.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "TestViewController.h"
#import "SettingViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 50)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点击跳转" forState:UIControlStateNormal];
    
}

- (void)buttonClickedAction{
    SettingViewController *vc = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
