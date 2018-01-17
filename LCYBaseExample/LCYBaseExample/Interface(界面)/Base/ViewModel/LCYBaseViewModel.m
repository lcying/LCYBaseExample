//
//  LCYBaseViewModel.m
//  SMQApp
//
//  Created by 刘岑颖 on 2018/1/15.
//  Copyright © 2018年 lcy. All rights reserved.
//

#import "LCYBaseViewModel.h"

@implementation LCYBaseViewModel

- (void)startRequest:(YTKRequest *)api andSuccess:(void(^)(id obj))successBlock andFailedBlock:(void(^)(id obj))failedBlock{
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSDictionary *dict = [CommonUtil dictionaryWithJsonString:request.responseString];
        NSString *code = [NSString stringWithFormat:@"%@",[dict objectForKey:@"errNum"]];
        if ([code isEqualToString:RIGHT_CODE]) {
            successBlock(dict);
        }else{
            NSString *errMsg = [NSString stringWithFormat:@"%@",[dict objectForKey:@"errMsg"]];
            failedBlock(errMsg);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSDictionary *dict = [CommonUtil dictionaryWithJsonString:request.responseString];
        NSString *errMsg = [NSString stringWithFormat:@"%@",[dict objectForKey:@"errMsg"]];
        failedBlock(errMsg);
    }];
}

@end
