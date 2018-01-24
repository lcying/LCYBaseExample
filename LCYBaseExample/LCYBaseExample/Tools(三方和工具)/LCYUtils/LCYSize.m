//
//  LCYSize.m
//  WaWaJi
//
//  Created by liuying on 2017/7/26.
//  Copyright © 2017年 yingyingying.com. All rights reserved.
//

#import "LCYSize.h"

@implementation LCYSize

+ (CGFloat) getScaleW:(CGFloat)w {
    return [LCYSize getNetScale:SCREEN_WIDTH withScreen:375] * w;
}

+ (CGFloat) getScaleH:(CGFloat)h {
    return [LCYSize getNetScale:SCREEN_HEIGHT withScreen:667] * h;
}

+ (CGFloat) getNetScale:(CGFloat)w1 withScreen:(CGFloat)w2{
    CGFloat scale = 0;
    scale = w1/w2;
    return scale;
}

@end
