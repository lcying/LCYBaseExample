//
//  LCYBaseViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYBaseViewController.h"
#import "SpotsLoadingView.h"

@interface LCYBaseViewController ()

@property (nonatomic, strong) SpotsLoadingView *sLoadingView;

@end

@implementation LCYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_BACKGROUND;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/* 设置状态栏颜色 */
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

#pragma mark - method -----------------------

- (void)lcy_showLoadingAction{
    dispatch_async(dispatch_get_main_queue(), ^{
        SpotsLoadingView *sloadingView = [[SpotsLoadingView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2.0 - 25, SCREEN_HEIGHT/2.0 - 25, 50, 50)];
        sloadingView.kColor = [UIColor lightGrayColor];
        sloadingView.kSpotRadius = 4.0;
        sloadingView.kRadius = 18.0;
        [self.view addSubview:sloadingView];
        [sloadingView startAnimation];
        self.sLoadingView = sloadingView;
    });
}

- (void)lcy_hideLoadingAction{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.sLoadingView removeFromSuperview];
        self.sLoadingView = nil;
    });
}

- (void)showToast:(NSString *)string{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:self.view animated:true];
        hub.mode = MBProgressHUDModeText;
        hub.margin = 10.f;
        hub.removeFromSuperViewOnHide = true;
        hub.labelText = string;
        [hub hide:true afterDelay:1.5];
    });
}

- (void)push:(NSString *)controllerName{
    Class class = NSClassFromString(controllerName);
    id controller = [[class alloc] init];
    [self.navigationController pushViewController:controller animated:true];
}

- (void)push:(NSString *)controllerName andData:(NSDictionary *)dict{
    Class class = NSClassFromString(controllerName);
    id controller = [[class alloc] init];
    ((LCYBaseViewController *)controller).receivedDictionary = dict;
    [self.navigationController pushViewController:controller animated:true];
}

-(void)pop{
    if (self.presentingViewController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)popToController:(NSString *)controllerName{
    Class class = NSClassFromString(controllerName);
    id controller = [[class alloc] init];
    NSArray *temArray = self.navigationController.viewControllers;
    for(UIViewController *temVC in temArray){
        if ([temVC isKindOfClass:[controller class]]){
            [self.navigationController popToViewController:temVC animated:YES];
        }
    }
}

- (void)popToRoot{
    [self.navigationController popToRootViewControllerAnimated:true];
}

@end
