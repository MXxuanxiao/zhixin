//
//  RegisterViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/26.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
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


- (IBAction)SMSCode:(id)sender {
    [Help alert:@"791272"];
}

- (IBAction)register:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
