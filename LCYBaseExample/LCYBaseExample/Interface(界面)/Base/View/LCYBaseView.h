//
//  LCYBaseView.h
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCYNaviView.h"

@interface LCYBaseView : UIView

@property (nonatomic, strong) LCYNaviView *topBarView;

- (void)showNoDataView;

- (void)hideNoDataView;

@end
