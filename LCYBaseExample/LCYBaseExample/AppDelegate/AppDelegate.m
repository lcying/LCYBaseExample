//
//  AppDelegate.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "AppDelegate.h"
#import "RootNaviViewController.h"
#import "LCYPageViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self initRootViewController];
    return YES;
}

- (void)initRootViewController{
    RootNaviViewController *naviVC = [[RootNaviViewController alloc] initWithRootViewController:[[LCYPageViewController alloc] init]];
    self.window.rootViewController = naviVC;
}

@end
