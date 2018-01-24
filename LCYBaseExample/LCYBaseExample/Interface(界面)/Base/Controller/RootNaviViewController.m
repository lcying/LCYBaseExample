//
//  RootNaviViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/23.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "RootNaviViewController.h"

@interface RootNaviViewController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation RootNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏导航栏
    self.navigationBar.hidden = YES;
    self.navigationBarHidden = YES;
    
    __weak RootNaviViewController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = true;
    }
//    设置某个界面不支持右滑返回手势
//    if ([viewController isKindOfClass:[ShootOnlyOneViewController class]]) {
//        navigationController.interactivePopGestureRecognizer.enabled = false;
//    }
    
    if (navigationController.viewControllers.count == 1) {
        navigationController.interactivePopGestureRecognizer.enabled = true;
        navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}

/*- 为了实现某个页面支持横竖屏 -*/
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
//    设置某个界面支持不同的方向
//    UIViewController *vc =  self.topViewController;
//    if([vc isKindOfClass:[ShootOnlyOneViewController class]]){//要横屏的界面
//        return (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
//    }
    
    return (toInterfaceOrientation == UIInterfaceOrientationPortrait);
}

//是否支持旋转
- (BOOL)shouldAutorotate
{
//    UIViewController *vc =  self.topViewController;
//    if([vc isKindOfClass:[ShootOnlyOneViewController class]]){//要横屏的界面
//        return YES;
//    }
//    //横屏的上一个界面，要返回为YES,否则横屏返回的时候上一界面不能还原成竖屏
    
    return NO;
}


//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
//    UIViewController *vc =  self.topViewController;
//    if([vc isKindOfClass:[ShootOnlyOneViewController class]]){//要横屏的界面
//        return UIInterfaceOrientationMaskLandscapeRight;
//    }
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
