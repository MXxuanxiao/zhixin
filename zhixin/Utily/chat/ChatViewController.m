//
//  ChatViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "ChatViewController.h"
#import "InfoViewController.h"
@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    kNavBackColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}
//点击cell头像回调
- (void)didTapCellPortrait:(NSString *)userId {
    NG(@"点击头像");
    InfoViewController *vc = Alloc(InfoViewController);
    [self.navigationController pushViewController:vc animated:YES];
}
//长按会话回调
- (void)didLongTouchMessageCell:(RCMessageModel *)model inView:(UIView *)view {
    NG(@"长按会话");
    [super didLongTouchMessageCell:model inView:view];
}
//点击电话回调
- (void)didTapPhoneNumberInMessageCell:(NSString *)phoneNumber model:(RCMessageModel *)model {
    [super didTapPhoneNumberInMessageCell:phoneNumber model:model];
}
//点击url回调
- (void)didTapUrlInMessageCell:(NSString *)url model:(RCMessageModel *)model {
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
