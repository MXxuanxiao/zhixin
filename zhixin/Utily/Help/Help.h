//
//  Help.h
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HttpRequest.h"
@interface Help : NSObject
/**
 *  弹窗通知
 *
 *  @param string
 */
+(void)alert:(NSString *)string;
/**
 *  弹出警告窗
 *
 *  @param string
 */
+(void)warning:(NSString *)string;
/**扫码*/
+ (void)scanWithViewController:(UIViewController*)viewController;
/**设置视图为圆形*/
+ (void)setImageCircular:(UIView*)imageView;
/**键盘消失,需定义keyBoardDown：方法*/
+ (void)keyBoardDownWithController:(UIViewController *)vc;
/**
 *  保存用户信息到本地
 *
 *  @param userName  用户名
 *  @param userIcon  用户头像
 *  @param userToken 用户TOKEN
 */
+ (void)saveUserInfoName:(NSString *)userName icon:(NSString *)userIcon token:(NSString *)userToken;
@end
