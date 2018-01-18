//
//  LCYPageViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYPageViewController.h"
#import "LCYPageView.h"

@interface LCYPageViewController ()

@property (nonatomic, strong) LCYPageView *pageView;

@end

@implementation LCYPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initInterface];
}

- (void)initInterface{
    self.pageView = [[LCYPageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight)];
    [self.view addSubview:self.pageView];
}

@end
