//
//  RegisterViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/26.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
- (IBAction)cancle:(id)sender;
- (IBAction)SMSCode:(id)sender;
- (IBAction)register:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *firstPassword;
@property (weak, nonatomic) IBOutlet UITextField *secondPassWord;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *SMSCode;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [Help keyBoardDownWithController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)keyBoardDown:(id)sender {
    [self.phoneNum resignFirstResponder];
    [self.email resignFirstResponder];
    [self.firstPassword resignFirstResponder];
    [self.secondPassWord resignFirstResponder];
    [self.userName resignFirstResponder];
    [self.SMSCode resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancle:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)SMSCode:(id)sender {
    [Help alert:@"791272" andViewController:self];
}

- (IBAction)register:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
