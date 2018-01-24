//
//  LCYSize.h
//  WaWaJi
//
//  Created by liuying on 2017/7/26.
//  Copyright © 2017年 yingyingying.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCYSize : NSObject

// 获取相对屏幕宽度比例
+ (CGFloat) getScaleW:(CGFloat)w;
// 获取相对屏幕高度比例
+ (CGFloat) getScaleH:(CGFloat)h;

@end
