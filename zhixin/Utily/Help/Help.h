//
//  Help.h
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Help : NSObject

/**弹窗通知*/
+(void)alert:(NSString *)string andViewController:(UIViewController*)Vc;
/**扫码*/
+ (void)scanWithViewController:(UIViewController*)viewController;
/**设置视图为圆形*/
+ (void)setImageCircular:(UIView*)imageView;
/**键盘消失,需定义keyBoardDown：方法*/
+ (void)keyBoardDownWithController:(UIViewController *)vc;
@end
