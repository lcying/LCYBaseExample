//
//  LCYWelcomeViewController.m
//  LCYBaseExample
//
//  Created by 刘岑颖 on 2018/1/17.
//  Copyright © 2018年 刘岑颖. All rights reserved.
//

#import "LCYWelcomeViewController.h"

@interface LCYWelcomeViewController ()

@property (nonatomic) UIScrollView *scrollView;

@end

@implementation LCYWelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.contentSize = CGSizeMake(WELCOME_IMAGECOUNT*SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollView.pagingEnabled = true;
    _scrollView.showsHorizontalScrollIndicator = false;
    [self.view addSubview:_scrollView];
    //添加图片
    for (int i=0; i < WELCOME_IMAGECOUNT; i++) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        UIImage *image = [UIImage imageNamed:WELCOME_IMAGE(i)];
        imageview.image = image;
        [_scrollView addSubview:imageview];
        if (i == WELCOME_IMAGECOUNT - 1) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lastTap:)];
            imageview.userInteractionEnabled = true;
            [imageview addGestureRecognizer:tap];
        }
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

-(void)lastTap:(id)sender{
    _block(sender);
}

-(void)lastImageClick:(lastImageClickBlock)block{
    _block=block;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
