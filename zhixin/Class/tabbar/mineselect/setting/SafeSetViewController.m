//
//  SafeSetViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/1.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SafeSetViewController.h"
#import "SafeDetailViewController.h"
#import "SafeMailViewController.h"
@interface SafeSetViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;


@end

@implementation SafeSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"账号与安全";
    [self btnAdd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnAdd {
    [self target:self.btn1];
    [self target:self.btn2];
    [self target:self.btn3];
    [self target:self.btn4];    
}
- (void)target:(UIButton*)btn {
    [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)didSelect:(UIButton*)sender {
    switch (sender.tag-100) {
        case 0: {
            Push(SafeDetailViewController);
        } break;
        case 1: {
            Push(SafeMailViewController);
        } break;
        case 2: {
            NG(@"2");
        } break;
        default: {
            NG(@"3");
        }
    }
}

@end
