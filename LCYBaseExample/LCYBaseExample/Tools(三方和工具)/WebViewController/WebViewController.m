//
//  WebViewController.m
//  BaseExample
//
//  Created by 朱林峰 on 2017/3/18.
//  Copyright © 2017年 james. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>

@property (nonatomic) WKWebViewConfiguration *configuration;
@property (nonatomic) WKWebView *webView;
@property (nonatomic) UIProgressView *progressView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWKWebView];
    [self initProgressView];
}

- (void)initWKWebView{
    _configuration = [[WKWebViewConfiguration alloc] init];
    _configuration.userContentController = [WKUserContentController new];
    [_configuration.userContentController addScriptMessageHandler:self name:@"ScanAction"];
    WKPreferences *preferences = [WKPreferences new];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    _configuration.preferences = preferences;
    //判断是否是首页的webview，如果是首页的webview，需要减去顶栏和底栏的高度；如果不是首页的webview，只需要减去顶栏的高度
    if ([[self.receivedDictionary objectForKey:@"isMain"] isEqualToString:@"true"]) {
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight - SafeAreaBottomHeight) configuration:_configuration];
    }else{
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT - SafeAreaTopHeight) configuration:_configuration];
    }
    //添加KVO监听网页加载进度
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.receivedDictionary objectForKey:@"strUrl"]]];
    [self.webView loadRequest:request];
    
    self.webView.UIDelegate = self;
    [self.view addSubview:self.webView];
}

//初始化进度条
- (void)initProgressView{
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, 2)];
    self.progressView.tintColor = [UIColor colorWithRed:22.f / 255.f green:126.f / 255.f blue:251.f / 255.f alpha:1.0];;
    self.progressView.trackTintColor = [UIColor whiteColor];
    [self.view addSubview:self.progressView];
}

// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

#pragma mark - WKUIDelegate
//当把JS返回给控制器,然后弹窗就是这样设计的
- (void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    //message.body  --  Allowed types are NSNumber, NSString, NSDate, NSArray,NSDictionary, and NSNull.
    NSLog(@"body:%@",message.body);
}


- (void)viewDidDisappear:(BOOL)animated{
    [_configuration.userContentController removeScriptMessageHandlerForName:@"ScanAction"];
}

// 记得取消监听
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
