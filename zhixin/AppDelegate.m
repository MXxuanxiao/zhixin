//
//  AppDelegate.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/21.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "AppDelegate.h"
#import <RongIMKit/RongIMKit.h>
#import <UMSocial.h>
#import <UMSocialSinaSSOHandler.h>
#import <UMSocialSinaHandler.h>
#import <UMSocialQQHandler.h>
#import <UMSocialWechatHandler.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    //http://59.83.32.13/api/user?username=18200000000&userpwd=123456
//    [HttpRequest request:@"http://59.83.32.13/api" data:@{@"User":@"123"} successBlock:^(id data) {
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NG(@"2");
//    } failureBlock:^(id error) {
//        NG(@"1");
//    }];
    NSLog(@"%@",NSHomeDirectory());
    //可以解决iPhone Plus横屏模式进入app导致界面错乱
    [application setStatusBarOrientation:UIInterfaceOrientationPortrait];
    
    //这个在IOS8以上都需要权限滴
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    //设置标签栏格式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //融云key
    [[RCIM sharedRCIM] initWithAppKey:kRCIMKey];
    //支持回调
    [[RCIMClient sharedRCIMClient] disconnect:YES];
    //聊天界面，头像为圆形
    [RCIM sharedRCIM].globalMessageAvatarStyle = RC_USER_AVATAR_CYCLE;
    //先放这以后放到登录界面
    [[RCIM sharedRCIM] connectWithToken:kRCIMToken success:^(NSString *userId) {
        NG2(@"登陆成功  -- Id:%@", userId);
    } error:^(RCConnectErrorCode status) {
        NG2(@"登录失败 -- error:%ld", status);
    } tokenIncorrect:^{
        NG(@"Token错误");
    }];
    //友盟key
    [UMSocialData setAppKey:kUMKey];
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:kSinaKey RedirectURL:nil];
    [UMSocialSinaHandler openSSOWithRedirectURL:nil];
    //[UMSocialQQHandler setSupportWebView:YES];
    [UMSocialQQHandler setQQWithAppId:kTencentID appKey:kTencentKey url:nil];
    
    [UMSocialWechatHandler setWXAppId:kWeCharID appSecret:kWeChatKey url:nil];
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}
@end
