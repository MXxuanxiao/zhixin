//
//  MXAlertView.m
//  MXAlertView
//
//  Created by MX_xuanxiao on 16/2/16.
//  Copyright © 2016年 MX. All rights reserved.
//
//  CSDN博客 http://blog.csdn.net/mx_xuanxiao
//

#import "MXAlertView.h"
#import <QuartzCore/QuartzCore.h>
static MXAlertView *mxAlertView;
double angle = 0;
static float ktime = 1.0f;
static int num = 1;
@interface MXAlertView ()

@property (nonatomic,strong)UILabel* label;
@property (nonatomic,strong)UIImageView *imageView;
@end
@implementation MXAlertView

- (instancetype)initWithImageAndFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor  = [UIColor whiteColor];
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-frame.size.height/4)/2, frame.size.height/4, frame.size.height/4, frame.size.height/4)];
        [self addSubview:_imageView];
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height/2, frame.size.width, frame.size.height/2)];
        _label.textAlignment = 1;
        _label.backgroundColor = [UIColor clearColor];
        _label.numberOfLines = 0;
        _label.textColor = [UIColor blackColor];
        [self addSubview:_label];
        self.center = CGPointMake(kWidth/2.0, kHeight/4.0);
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 1.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return self;
}
+ (instancetype)share {

    if (mxAlertView) {
        return mxAlertView;
    }
    mxAlertView = [[MXAlertView alloc] initWithImageAndFrame:CGRectMake(0, 0, kWidth/7*5, kWidth*kBI*kBI)];
    
    return mxAlertView;
}
/**
 *  显示信息
 *
 *  @param string 显示的内容
 */
+ (void)mx_showInfo:(NSString *)string {
    [[self share] mx_setText:string];
    [[self share] mx_setImage:[UIImage imageNamed:@"get"]];
    [[self share] mx_dismiss];
    
}
/**
 *  显示等待信息
 *
 *  @param string 显示内容
 */
+ (void)mx_showScan:(NSString *)string {
    [[self share] mx_setText:string];
    [[self share] mx_setImage:[UIImage imageNamed:@"scan"]];
    [[self share] mx_startAnimation];
}
/**
 *  显示成功信息
 *
 *  @param string 显示内容
 */
+ (void)mx_showSuccess:(NSString *)string {
    [[self share] mx_setText:string];
    [[self share] mx_setImage:[UIImage imageNamed:@"success"]];
    [[self share] mx_dismiss];
}
/**
 *  显示失败信息
 *
 *  @param strring 显示内容
 */
+ (void)mx_showError:(NSString *)string {
    [[self share] mx_setText:string];
    [[self share] mx_setImage:[UIImage imageNamed:@"error"]];
    [[self share] mx_dismiss];
    
}
/**
 *  显示警告信息
 *
 *  @param string 显示内容
 */
+ (void)mx_showWarning:(NSString *)string {
    [[self share] mx_setText:string];
    [[self share] mx_setImage:[UIImage imageNamed:@"info"]];
    [[self share] mx_dismiss];
}
/**
 *  设置背景色
 *
 *  @param color 颜色
 */
+ (void)mx_setbackgroundColor:(UIColor *)color {
    [[self share] setBackgroundColor:color];
}
/**
 *  设置字体颜色
 *
 *  @param color 颜色
 */
+ (void)mx_setFontColor:(UIColor *)color {
    [[self share] mx_setFontColor:color];
    
}
- (void)mx_setFontColor:(UIColor *)color {
    self.label.textColor = color;
    
}
- (void)mx_setImage:(UIImage *)image {
    self.imageView.image = image;
}
- (void)mx_setText:(NSString *)string {
    ktime = 1.0f;
    self.label.text = string;
}
+ (void)mx_dismissView {
    [[MXAlertView share] mx_dismiss];
}
- (void)mx_dismiss {
    for (UIView *subView in self.subviews) {
        [subView.layer removeAllAnimations];
    }
    //不阻塞主线程
    double delayInSeconds = ktime;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self removeFromSuperview];
    });
    if (ktime == 0) {
        mxAlertView = nil;
    }

}
-(void) mx_startAnimation
{
    ktime = 0;
    [UIView beginAnimations:@"scanAnimation" context:nil];
    [UIView setAnimationDuration:0.04*num];
    [UIView setAnimationDidStopSelector:@selector(endAnimation)];
    [UIView setAnimationDelegate:self];
    _imageView.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));
    [UIView commitAnimations];
    
}

-(void)endAnimation
{
    angle += 15;
    [self mx_startAnimation];
}
@end
