//
//  MXAlertView.h
//  MXAlertView
//
//  Created by MX_xuanxiao on 16/2/16.
//  Copyright © 2016年 MX. All rights reserved.
//
//  CSDN博客 http://blog.csdn.net/mx_xuanxiao
//

#import <UIKit/UIKit.h>

#define kBI 0.618
#define kFBI 0.382
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@interface MXAlertView : UIView
+ (instancetype)share;
/**
 *  显示信息
 *
 *  @param string 显示内容
 */
+ (void)mx_showInfo:(NSString *)string;
/**
 *  显示等待信息
 *
 *  @param string 显示内容
 */
+ (void)mx_showScan:(NSString *)string;
/**
 *  显示成功信息
 *
 *  @param string 显示内容
 */
+ (void)mx_showSuccess:(NSString *)string;
/**
 *  显示失败信息
 *
 *  @param strring 显示内容
 */
+ (void)mx_showError:(NSString *)strring;
/**
 *  显示警告信息
 *
 *  @param string 显示内容
 */
+ (void)mx_showWarning:(NSString *)string;
/**
 *  设置背景色
 *
 *  @param color 颜色
 */
+ (void)mx_setbackgroundColor:(UIColor *)color;
/**
 *  设置字体颜色
 *
 *  @param color 颜色
 */
+ (void)mx_setFontColor:(UIColor *)color;
+ (void)mx_dismissView;

@end
