//
//  ClassifyViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/31.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "ClassifyViewController.h"
#import "SSVideoPlayContainer.h"
#import "SSVideoPlayController.h"
@interface ClassifyViewController ()

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    kNavBackColor;
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.titleValue;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
