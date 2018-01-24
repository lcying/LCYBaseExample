//
//  LCYPageViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYPageViewController.h"
#import "LCYPageView.h"
#import "TestViewController.h"

@interface LCYPageViewController ()

@property (nonatomic, strong) LCYPageView *pageView;

@property (nonatomic, strong) TestViewController *vc0;
@property (nonatomic, strong) TestViewController *vc1;
@property (nonatomic, strong) TestViewController *vc2;

@end

@implementation LCYPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initInterface];
    [self addPageSubviews];
}

- (void)initInterface{
    self.pageView = [[LCYPageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight)];
    [self.view addSubview:self.pageView];
}

- (void)addPageSubviews{
    self.vc0 = [[TestViewController alloc] init];
    self.vc0.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 40);
    self.vc1 = [[TestViewController alloc] init];
    self.vc1.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 40);
    self.vc2 = [[TestViewController alloc] init];
    self.vc2.view.frame = CGRectMake(SCREEN_WIDTH * 2, 0, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - 40);
    
    _vc0.view.backgroundColor = [UIColor orangeColor];
    _vc1.view.backgroundColor = [UIColor yellowColor];
    _vc2.view.backgroundColor = [UIColor greenColor];
    
    [self.pageView.contentScrollView addSubview:self.vc0.view];
    [self.pageView.contentScrollView addSubview:self.vc1.view];
    [self.pageView.contentScrollView addSubview:self.vc2.view];
    
    [self addChildViewController:self.vc0];
    [self addChildViewController:self.vc1];
    [self addChildViewController:self.vc2];
}

@end
