//
//  CommonUtil.h
//  SMQApp
//  常用的一些方法
//  Created by SMQApp on 2017/3/18.
//  Copyright © 2017年 SMQApp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtil : NSObject

/**
 * 计算缓存
 */
+ (float)countCache;

/**
 * 清除缓存
 */
+ (void)clearCache;

/**
 * json格式字符串转字典
 */
+ (id)dictionaryWithJsonString:(NSString *)jsonString;

/**
 * 时间戳毫秒转换成时间格式
 */
+ (NSString *)stringToDate:(NSString *)string;

/**
 * 得到size
 */
+ (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize andStr:(NSString *)str;

/**
 * 判断手机号
 */
+ (BOOL)isRightPhoneNumber:(NSString *)phoneNumber;

@end
