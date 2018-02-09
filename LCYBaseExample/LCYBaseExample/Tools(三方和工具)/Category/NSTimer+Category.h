//
//  NSTimer+Category.h
//  XinHuaHua
//
//  Created by 刘岑颖 on 2017/6/30.
//  Copyright © 2017年 lcy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Category)

/**
 *  创建NSTimer,直接带Block
 *
 *  @param interval     时长
 *  @param block        方法
 *  @param repeats      是否重复
 *
 *  @return NSTimer
 */
+ (NSTimer *)lcy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)(void))block repests:(BOOL)repeats;

@end
