//
//  StartViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/1.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

- (IBAction)click:(id)sender;
@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)click:(id)sender {
    kMapNav(@"39.5,117.5", @"39,117");
}
@end
