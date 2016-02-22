//
//
//
//
//  Created by lbxia on 15/10/21.
//  Copyright © 2015年 lbxia. All rights reserved.
//

#import "SubLBXScanViewController.h"
#import "LBXScanResult.h"
#import "LBXScanWrapper.h"


@interface SubLBXScanViewController ()

@end

@implementation SubLBXScanViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor blackColor];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
//    btn.frame = CGRectMake(0, 0, 50, 30);
//    btn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-100);
//    [btn setTitle:@"退出" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//    
//    btn.layer.borderWidth = 1.5;
//    [self.view addSubview:btn];
//    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    btn.layer.cornerRadius = 4.5;
//    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    if (_isQQSimulator) {
        
        [self drawBottomItems];
        [self drawTitle];
        [self.view bringSubviewToFront:_topTitle];
    }
    else
        _topTitle.hidden = YES;
    
    
}

//绘制扫描区域
- (void)drawTitle
{
    if (!_topTitle)
    {
        
        
        self.topTitle = [[UILabel alloc]init];
        _topTitle.bounds = CGRectMake(0, 0, 145, 60);
        _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 50);
        
        //3.5inch iphone
        if ([UIScreen mainScreen].bounds.size.height <= 568 )
        {
            _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 38);
            _topTitle.font = [UIFont systemFontOfSize:14];
        }
        
        
        _topTitle.textAlignment = NSTextAlignmentCenter;
        _topTitle.numberOfLines = 0;
        _topTitle.text = @"将取景框对准二维码即可自动扫描";
        _topTitle.textColor = [UIColor whiteColor];
        [self.view addSubview:_topTitle];
    }
    
    
}

- (void)drawBottomItems
{
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 50, 30);
    btn.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height-100);
    [btn setTitle:@"退出" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    btn.layer.borderWidth = 1.5;
    [self.view addSubview:btn];
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.cornerRadius = 4.5;
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}




- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    
    if (array.count < 1)
    {
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //经测试，可以同时识别2个二维码，不能同时识别二维码和条形码
//    for (LBXScanResult *result in array) {
//        
//        //NSLog(@"scanResult:%@",result.strScanned);
//    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //震动提醒
    [LBXScanWrapper systemVibrate];
    //声音提醒
    [LBXScanWrapper systemSound];
    
    
    //[self popAlertMsgWithScanResult:strResult];
    
    [self showNextVCWithScanResult:scanResult];
    
}

- (void)popAlertMsgWithScanResult:(NSString*)strResult
{
    if (!strResult) {
        
        strResult = @"识别失败";
    }
    
    __weak __typeof(self) weakSelf = self;
        
        //点击完，继续扫码
        [weakSelf reStartDevice];
}

- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
    NSLog(@"%@",strResult.strScanned);
    [self back:nil];
    
}




@end
