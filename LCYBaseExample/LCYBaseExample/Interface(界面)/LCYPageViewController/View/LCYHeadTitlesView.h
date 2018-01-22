//
//  LCYHeadTitlesView.h
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCYHeadTitlesView : UIView

@property (nonatomic, strong) void(^LCYCurrentHeadTitlesChangedCallBack)(NSInteger index);

- (instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titlesArray;

- (void)setLineViewHidden:(BOOL)hidden;

- (void)setSelectedIndex:(NSInteger)index;

@end
