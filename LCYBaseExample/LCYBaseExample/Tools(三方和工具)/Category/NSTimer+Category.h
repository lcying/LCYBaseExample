//
//  NSTimer+Category.h
//  XinHuaHua
//
//  Created by 刘岑颖 on 2017/6/30.
//  Copyright © 2017年 lcy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Category)

//nstimer自带block的方法在iOS10之前不能用
+ (NSTimer *)lcy_scheduledTimerWithTimeInterval:(NSTimeInterval)interval block:(void(^)())block repests:(BOOL)repeats;

@end
