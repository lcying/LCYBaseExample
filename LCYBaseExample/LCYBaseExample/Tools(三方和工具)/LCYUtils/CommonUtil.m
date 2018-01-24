//
//  CommonUtil.m
//  SMQApp
//
//  Created by SMQApp on 2017/3/18.
//  Copyright © 2017年 SMQApp. All rights reserved.
//

#import "CommonUtil.h"
#import <sys/utsname.h>

@implementation CommonUtil

+ (float)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

+ (float)countCache{
    NSString *path = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory ,NSUserDomainMask , YES ) firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    float folderSize = 0.0;
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            folderSize +=[self fileSizeAtPath:absolutePath];
        }
        folderSize += [YYImageCache sharedCache].memoryCache.totalCost/1024.0/1024.0;
        folderSize += [YYImageCache sharedCache].diskCache.totalCost/1024.0/1024.0;
        return folderSize;
    }
    return 0;
}

+ (void)clearCache{
    NSString *path = [ NSSearchPathForDirectoriesInDomains (NSCachesDirectory ,NSUserDomainMask , YES ) firstObject ];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    [[YYImageCache sharedCache].memoryCache removeAllObjects];
    [[YYImageCache sharedCache].diskCache removeAllObjectsWithBlock:^{}];
}

+ (id)dictionaryWithJson:(id)json{
    if (!json || json == (id)kCFNull) {
        return nil;
    }
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    }
    
    if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    
    NSError *err;
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    }
    
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    
    NSDictionary *noNullDic = [self nullDic:dic];
    return noNullDic;
}

+ (NSDictionary *)nullDic:(NSDictionary *)myDic{
    NSArray *keyArr = [myDic allKeys];
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    for (int i = 0; i < keyArr.count; i ++){
        id obj = [myDic objectForKey:keyArr[i]];
        obj = [self changeType:obj];
        [resDic setObject:obj forKey:keyArr[i]];
    }
    return resDic;
}

+ (NSArray *)nullArr:(NSArray *)myArr{
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < myArr.count; i ++){
        id obj = myArr[i];
        obj = [self changeType:obj];
        [resArr addObject:obj];
    }
    return resArr;
}

//将Null类型的项目转化成@""
+(NSString *)nullToString{
    return @"";
}

+(NSString *)stringToString:(NSString *)string{
    return string;
}

//类型识别:将所有的NSNull类型转化成@""
+ (id)changeType:(id)myObj{
    if ([myObj isKindOfClass:[NSDictionary class]]){
        return [self nullDic:myObj];
    }else if([myObj isKindOfClass:[NSArray class]]){
        return [self nullArr:myObj];
    }else if([myObj isKindOfClass:[NSString class]]){
        return [self stringToString:myObj];
    }else if([myObj isKindOfClass:[NSNull class]]){
        return [self nullToString];
    }else{
        return myObj;
    }
}

//时间戳毫秒转换成时间格式
+ (NSString *)stringToDate:(NSString *)string{
    //给的是毫秒
    NSTimeInterval timeInterval = [string doubleValue]/1000.0;
    NSDate *dateNow = [NSDate date];
    NSTimeInterval timeNowInterval = [dateNow timeIntervalSince1970];
        long int i = timeNowInterval - timeInterval;
    if (i < 60) {
        return [NSString stringWithFormat:@"%ld秒前",i];
    }else if(3600 > i && i >= 60){
        return [NSString stringWithFormat:@"%ld分钟前",i/60];
    }else if(3600 * 24 > i && i >= 3600){
        return [NSString stringWithFormat:@"%ld小时前",i/3600];
    }
    NSDate *getDate = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:getDate];
    return currentDateStr;
}

+ (CGSize)sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize andStr:(NSString *)str{
    NSDictionary *dic = @{NSFontAttributeName : font};
    return [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
}

+ (BOOL)isRightPhoneNumber:(NSString *)phoneNumber{
    //1开头 且是11位
    NSString *string = @"^1\\d{10}$";
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", string];
    if ([regextestct evaluateWithObject:phoneNumber]) {
        return YES;
    }
    return NO;
}

@end
