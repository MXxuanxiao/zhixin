//
//  Help.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "Help.h"
#import "SubLBXScanViewController.h"
@implementation Help


+(void)alert:(NSString *)string andViewController:(UIViewController*)Vc; {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"通知" message:string preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancle= [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancle];
    [Vc presentViewController:alert animated:YES completion:nil];
}


+ (void)scanWithViewController:(UIViewController*)viewController {
    //设置扫码区域参数设置
    
    //创建参数对象
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    
    //矩形区域中心上移，默认中心点为屏幕中心点
    style.centerUpOffset = 44;
    
    //扫码框周围4个角的类型,设置为外挂式
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    
    //扫码框周围4个角绘制的线条宽度
    style.photoframeLineW = 6;
    
    //扫码框周围4个角的宽度
    style.photoframeAngleW = 24;
    
    //扫码框周围4个角的高度
    style.photoframeAngleH = 24;
    
    //扫码框内 动画类型 --线条上下移动
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    
    //线条上下移动图片
    style.animationImage = [UIImage imageNamed:@"qrcode_scan_light_green"];
    
    //SubLBXScanViewController继承自LBXScanViewController
    //添加一些扫码或相册结果处理
    SubLBXScanViewController *vc = [SubLBXScanViewController new];
    vc.style = style;
    vc.isOpenInterestRect = YES;
    vc.isQQSimulator = YES;
    [viewController presentViewController:vc animated:YES completion:nil];
}

+ (void)setImageCircular:(UIView*)imageView {
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = imageView.bounds.size.width/2;
}
+ (void)keyBoardDownWithController:(UIViewController *)vc {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:vc action:@selector(keyBoardDown:)];
    [vc.view addGestureRecognizer:tap];
}
-(void)keyBoardDown:(id)sender {
    // 就是为了去掉警告
}
@end
