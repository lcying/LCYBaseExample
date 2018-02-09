//
//  NSTimer+Category.m
//  XinHuaHua
//
//  Created by 刘岑颖 on 2017/6/30.
//  Copyright © 2017年 lcy. All rights reserved.
//

#import "NSTimer+Category.h"

@implementation NSTimer (Category)

+ (NSTimer *)lcy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void (^)(void))block repests:(BOOL)repeats{
    return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(lcy_blockInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)lcy_blockInvoke:(NSTimer *)timer{
    void(^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
}

@end
