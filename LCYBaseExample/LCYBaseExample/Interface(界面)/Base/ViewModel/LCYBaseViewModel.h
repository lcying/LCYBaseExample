//
//  LCYBaseViewModel.h
//  SMQApp
//
//  Created by 刘岑颖 on 2018/1/15.
//  Copyright © 2018年 lcy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCYBaseViewModel : NSObject


- (void)startRequest:(YTKRequest *)api andSuccess:(void(^)(id obj))successBlock andFailedBlock:(void(^)(id obj))failedBlock;

@end
