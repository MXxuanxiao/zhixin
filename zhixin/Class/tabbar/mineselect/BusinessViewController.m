//
//  BusinessViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/27.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "BusinessViewController.h"

@interface BusinessViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollow;

@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"智信商学院";
    // Do any additional setup after loading the view from its nib.
    kNavBackColor;
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 800)];
    imageView.image = [UIImage imageNamed:@"bus"];
    self.scrollow.contentSize = CGSizeMake(0, 750);
    self.scrollow.showsVerticalScrollIndicator = NO;
    [self.scrollow addSubview:imageView];
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
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
