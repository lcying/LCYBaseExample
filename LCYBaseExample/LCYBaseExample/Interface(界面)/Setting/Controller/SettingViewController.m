//
//  SettingViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingView.h"

@interface SettingViewController ()

@property (nonatomic, strong) SettingView *settingView;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initInterface];
}

- (void)initInterface{
    self.settingView = [[SettingView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight)];
    [self.view addSubview:_settingView];
    
    [self.settingView.topBarView leftClickPop];
}

@end
