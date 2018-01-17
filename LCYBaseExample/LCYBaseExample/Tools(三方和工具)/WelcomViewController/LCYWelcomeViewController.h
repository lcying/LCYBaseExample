//
//  LCYWelcomeViewController.h
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYBaseViewController.h"

typedef void (^lastImageClickBlock)(UIImageView *imageview);

@interface LCYWelcomeViewController : LCYBaseViewController

@property (copy,nonatomic) lastImageClickBlock block;
//最后一张图片点击事件
- (void)lastImageClick:(lastImageClickBlock)block;

@end
