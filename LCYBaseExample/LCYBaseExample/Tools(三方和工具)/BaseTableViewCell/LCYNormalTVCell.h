//
//  LCYNormalTVCell.h
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/18.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LCYNormalTVCellTypeTitleArrow,//左边标题 右边label 右边箭头
    LCYNormalTVCellTypeImageTitleArrow//左边图片 标题 右边label 箭头
} LCYNormalTVCellType;

@interface LCYNormalTVCell : UITableViewCell

- (void)setType:(LCYNormalTVCellType)type;
- (void)setTitle:(NSString *)title;
- (void)setDetail:(NSString *)detail;
- (void)setImage:(NSString *)imagename;

@end
