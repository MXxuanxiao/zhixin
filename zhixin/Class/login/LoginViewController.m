//
//  LoginViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/26.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FindViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
- (IBAction)loginBtn:(id)sender;
- (IBAction)registerBtn:(id)sender;
- (IBAction)findBtn:(id)sender;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [Help keyBoardDownWithController:self];
}
- (void)keyBoardDown:(id)sender {
    [self.userID resignFirstResponder];
    [self.passWord resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginBtn:(id)sender {
    if ([self.userID.text isEqualToString:@""]||[self.passWord.text isEqualToString:@""]) {
       [Help alert:@"请输入用户名、密码" andViewController:self];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}

- (IBAction)registerBtn:(id)sender {
    RegisterViewController *vc = Alloc(RegisterViewController);
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)findBtn:(id)sender {
    FindViewController *vc = Alloc(FindViewController);
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
