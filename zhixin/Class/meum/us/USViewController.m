//
//  USViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/25.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "USViewController.h"

@interface USViewController ()

@end

@implementation USViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"关于我们";
    kNavBackColor;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
