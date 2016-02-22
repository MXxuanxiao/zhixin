//
//  AboutSetViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/1.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "AboutSetViewController.h"
#import <SVProgressHUD.h>
@interface AboutSetViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation AboutSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"关于智信";
    self.webView.backgroundColor = kLight;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]]];
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --webView delegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD showWithStatus:@"正在加载。。。"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD showSuccessWithStatus:@"加载成功"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
}


@end
