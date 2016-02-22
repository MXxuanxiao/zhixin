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
#import "SinaViewController.h"
#import <UMSocial.h>
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
- (IBAction)loginBtn:(id)sender;
- (IBAction)registerBtn:(id)sender;
- (IBAction)findBtn:(id)sender;
- (IBAction)sinaLogin:(id)sender;
- (IBAction)qqLogin:(id)sender;
- (IBAction)weChatLogin:(id)sender;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
       [Help warning:@"请输入用户名、密码"];
    }else {
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
}

- (IBAction)registerBtn:(id)sender {
    RegisterViewController *vc = Alloc(RegisterViewController);
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)findBtn:(id)sender {
    Model(FindViewController);
}

- (IBAction)sinaLogin:(id)sender {
    [self loginWithType:UMShareToSina];
}

- (IBAction)qqLogin:(id)sender {
    [self loginWithType:UMShareToQQ];
}

- (IBAction)weChatLogin:(id)sender {
    [self loginWithType:UMShareToWechatSession];
}
- (void)loginWithType:(NSString *)type {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:type];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:type];
            
            NSLog(@"username is %@, uid is %@, token is %@ url is %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            [Help saveUserInfoName:snsAccount.userName icon:snsAccount.iconURL token:snsAccount.accessToken];
        }
        
    });
}
@end
