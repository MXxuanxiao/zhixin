//
//  SafeMailViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/3.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SafeMailViewController.h"

@interface SafeMailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mail;
@property (weak, nonatomic) IBOutlet UILabel *alert;
- (IBAction)send:(id)sender;

@end

@implementation SafeMailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)send:(id)sender {
    NG(@"11");
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
