//
//  SinaViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/15.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SinaViewController.h"

@interface SinaViewController ()<UIWebViewDelegate>
@property (nonatomic, strong)UIWebView *webView;
@end

@implementation SinaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationItem.title = @"登录";
    self.navigationController.navigationBar.backgroundColor = kBlack;
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    self.webView.backgroundColor = kLight;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=2059878104&redirect_uri=http://www.baidu.com"]]];
    self.webView.delegate = self;
    [self creatbariteam];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --webView delegate
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [SVProgressHUD showWithStatus:@"正在加载..."];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [SVProgressHUD showSuccessWithStatus:@"加载成功"];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:error.localizedDescription];
}
-(void)creatbariteam {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(click1:)];
    self.navigationItem.leftBarButtonItem = item;
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
}
- (void)click1:(id)sender {
    //[self.navigationController popToRootViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
