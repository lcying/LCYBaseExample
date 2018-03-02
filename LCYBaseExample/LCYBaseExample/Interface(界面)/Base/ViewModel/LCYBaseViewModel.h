//
//  LCYBaseViewModel.h
//  SMQApp
//
//  Created by 刘岑颖 on 2018/1/15.
//  Copyright © 2018年 lcy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LCYNetworkRequestDelegate <NSObject>

- (void)successWithResponse:(NSDictionary *)dict;

- (void)failedWithResponse:(NSString *)error;

@end

@interface LCYBaseViewModel : NSObject

@property (nonatomic, weak) id<LCYNetworkRequestDelegate> delegete;

- (void)startRequest:(YTKRequest *)api andSuccess:(void(^)(id obj))successBlock andFailedBlock:(void(^)(id obj))failedBlock;

@end
