//
//  RegisterApi.m
//  BaseExample
//
//  Created by 朱林峰 on 2017/3/3.
//  Copyright © 2017年 james. All rights reserved.
//

#import "ExampleTwoApi.h"

@implementation ExampleTwoApi

- (id)initWithUsername:(NSString *)username password:(NSString *)password {
    self = [super init];
    if (self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/iphone/register";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"username": _username,
             @"password": _password
             };
}

//http清请求头如果有额外需求
- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    return @{@"client":@"sumaqiang v1.0"};
}

//参数格式如果有要求
- (YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeJSON;
}

@end
