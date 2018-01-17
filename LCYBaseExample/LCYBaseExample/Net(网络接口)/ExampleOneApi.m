//
//  ExampleOneApi.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "ExampleOneApi.h"

@implementation ExampleOneApi

//如果没有参数只需要重写两个方法即可
- (NSString *)requestUrl {
    return @"";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
