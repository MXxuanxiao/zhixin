//
//  InfoViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/25.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *sex;
@property (weak, nonatomic) IBOutlet UILabel *alias;
@property (weak, nonatomic) IBOutlet UILabel *account;
@property (weak, nonatomic) IBOutlet UIImageView *course1;
@property (weak, nonatomic) IBOutlet UIImageView *course2;
@property (weak, nonatomic) IBOutlet UIImageView *course3;
- (IBAction)friend:(id)sender;
- (IBAction)send:(id)sender;
- (IBAction)message:(id)sender;


@end

@implementation InfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"详细信息";
    [self setBackItem];
    [Help setImageCircular:self.icon];
    [Help setImageCircular:self.course1];
    [Help setImageCircular:self.course2];
    [Help setImageCircular:self.course3];
    
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

- (void)setBackItem {
    [self.navigationItem setHidesBackButton:YES];
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithTitle:@"< 会话" style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    self.navigationItem.leftBarButtonItem = cancle;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
}
- (void)click:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)friend:(id)sender {
    NG(@"加好友");
}

- (IBAction)send:(id)sender {
    NG(@"送花");
}

- (IBAction)message:(id)sender {
    NG(@"消息");
}
@end
