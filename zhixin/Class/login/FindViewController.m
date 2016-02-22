//
//  FindViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/26.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mail_lbl;
- (IBAction)mail_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *mail_view;

@property (weak, nonatomic) IBOutlet UITextField *num_lbl;
@property (weak, nonatomic) IBOutlet UITextField *password_lbl;
- (IBAction)get_btn:(id)sender;
- (IBAction)phone_btn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *phone_view;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    kNavBackColor;
    [self createSegment];
    [self creatbariteam];
    [self custemView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)custemView {
    [self.mail_view setFrame:CGRectMake(0, 85, self.mail_view.frame.size.width, self.mail_view.frame.size.height)];
    [self.phone_view setFrame:CGRectMake(0, 85, self.phone_view.frame.size.width, self.phone_view.frame.size.height)];
    self.mail_view.hidden = YES;
}
-(void)creatbariteam {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(click1:)];
    self.navigationItem.leftBarButtonItem = item;
    [self.navigationItem.leftBarButtonItem setTintColor:kLight];
}
- (void)click1:(id)sender {
    //[self.navigationController popToRootViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)createSegment {
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"手机找回",@"邮箱找回"]];
    [segment setFrame:CGRectMake(kWidth/4, 70, kWidth/2, 30)];
    segment.layer.masksToBounds = YES;
    segment.layer.borderWidth = 1.0 ;
    segment.layer.cornerRadius = 15.0;
    [segment addTarget:self action:@selector(click:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex = 0;
    segment.backgroundColor = kWhite;
    segment.tintColor = kBlack;
    [self.view addSubview:segment];
}
- (void)click:(UISegmentedControl*)sender {
    switch (sender.selectedSegmentIndex) {
        case 0: {
            self.phone_view.hidden = NO;
            self.mail_view.hidden = YES;
        }
            break;
            
        default: {
            self.mail_view.hidden = NO;
            self.phone_view.hidden = YES;
        }
            break;
    }
}
- (IBAction)mail_btn:(id)sender {
    NG(@"mail");
}
- (IBAction)get_btn:(id)sender {
    NG(@"code");
}

- (IBAction)phone_btn:(id)sender {
    NG(@"phone");
}
@end
