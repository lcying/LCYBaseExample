//
//  LCYMediator.h
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/2/26.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCYMediator : NSObject

+ (instancetype)sharedInstance;

/**
 * 远程app调用入口
 */
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

/**
 * 本地组件调用入口
 */
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params shouldCacheTarget:(BOOL)shouldCacheTarget;

/**
 * 移除
 */
- (void)releaseCachedTargetWithTargetName:(NSString *)targetName;

@end
