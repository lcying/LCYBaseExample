//
//  LCYBaseViewController.h
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCYBaseViewController : QMUICommonViewController

//接受上一个界面传过来的数据
@property (nonatomic) NSDictionary *receivedDictionary;

/**
 * 结束loading
 */
- (void)lcy_hideLoadingAction;

/**
 * 开始loading
 */
- (void)lcy_showLoadingAction;

/**
 * 弹纯文字框
 */
- (void)showToast:(NSString *)string;

/**
 * 不传数据，直接push到下一个界面
 */
- (void)push:(NSString*)controllerName;

/**
 *传数据到下一个界面
 */
- (void)push:(NSString *)controllerName andData:(NSDictionary *)dictionary;

/**
 *关闭界面，返回上一级
 */
- (void)pop;

/**
 *返回到固定界面
 */
- (void)popToController:(NSString *)controllerName;

/**
 *返回到主界面
 */
- (void)popToRoot;

@end
