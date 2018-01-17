//
//  Macro(宏文件).h
//  IOS-example
//
//  Created by 刘岑颖 on 2017/1/7.
//  Copyright © 2017年 lcy. All rights reserved.
//
#import "RACEXTScope.h"
#ifndef Macro______h
#define Macro______h

/*高度和宽度*/
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define PX_WIDTH [UIScreen mainScreen].bounds.size.width/375
#define PX_HEIGHT [UIScreen mainScreen].bounds.size.height/667
//导航栏高度
 #define SafeAreaTopHeight (SCREEN_HEIGHT == 812.0 ? 88 : 64)
//底边栏高度
 #define SafeAreaBottomHeight (SCREEN_HEIGHT == 812.0 ? 74 : 44)

/*欢迎页图片*/
#define WELCOME_IMAGECOUNT 3
#define WELCOME_IMAGE(index) [NSString stringWithFormat:@"welcome_image%d",index]

/*tabbar图标和文字*/
#define FIRSTTAB_TITLE @"FirstTab"
#define SECONDTAB_TITLE @"SecondTab"
#define THIRDTAB_TITLE @"ThirdTab"
#define FOURTH_TITLE @"FourthTab"

#define FIRSTTAB_ICON [UIImage imageNamed:@"example"]
#define SECONDTAB_ICON [UIImage imageNamed:@"example"]
#define THIRDTAB_ICON [UIImage imageNamed:@"example"]
#define FOURTHTAB_ICON [UIImage imageNamed:@"example"]

#define FIRSTTAB_SELECTED_ICON [UIImage imageNamed:@"example"]
#define SECONDTAB_SELECTED_ICON [UIImage imageNamed:@"example"]
#define THIRDTAB_SELECTED_ICON [UIImage imageNamed:@"example"]
#define FOURTH_SELECTED_ICON [UIImage imageNamed:@"example"]

//颜色
#define COLOR_MAIN [UIColor colorWithRed:49.0/255.0 green:168.0/255.0 blue:223.0/255.0 alpha:1.0]
#define COLOR_BACKGROUND [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]
#define COLOR_MAINTEXT [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]

//字体大小
#define FONT_MAIN [UIFont systemFontOfSize:14]

/*USER_DEFAULTS*/
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]

#endif /* Macro______h */
