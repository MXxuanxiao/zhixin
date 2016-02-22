//
//  ProhibitViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/19.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "ProhibitViewController.h"

@interface ProhibitViewController ()

@end

@implementation ProhibitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotate{
    //    return self.topViewController.shouldAutorotate;
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations

{
    return UIInterfaceOrientationMaskPortrait;//只支持这一个方向(正常的方向)
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
