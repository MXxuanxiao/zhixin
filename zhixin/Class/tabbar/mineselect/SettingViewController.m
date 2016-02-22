//
//  SettingViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/27.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginViewController.h"
#import "MineSetViewController.h"
#import "MessageSetViewController.h"
#import "PrivacySetViewController.h"
#import "FunctionViewController.h"
#import "SafeSetViewController.h"
#import "AboutSetViewController.h"
#import "CacheSetViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    self.tableView.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    [self createData];
    [self createFooterView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createcbtnItem {
    self.navigationItem.hidesBackButton = YES;
    UIBarButtonItem *cancle = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(click:)];
    
    self.navigationItem.leftBarButtonItem = cancle;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
}
- (void)click:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)createData {
    NSArray *arr = @[@"个人设置",@"消息设置",@"隐私",@"功能",@"账号与安全",@"关于智信",@" 清除缓存"];
    for (int i = 0; i< 7; i++) {
        NSDictionary *dict = @{@"name":[arr objectAtIndex:i],@"image":[UIImage imageNamed:@"icon58_58"]};
        [self.data addObject:dict];
    }
}
#pragma mark --delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *string = @"useAgain";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.textLabel.text = [[self.data objectAtIndex:indexPath.row] objectForKey:@"name"];
    cell.imageView.image = [[self.data objectAtIndex:indexPath.row] objectForKey:@"image"];
    return cell;
    
}
- (void)createFooterView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 60)];
    view.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame =CGRectMake(0, 20, kWidth-150, 40);
    btn.center = view.center;
    btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:141/255.0 blue:144/255.0 alpha:1.0];
    [btn setTitleColor:kWhite forState:UIControlStateNormal];
    [btn setTitle:@"退出" forState:UIControlStateNormal];
    [view addSubview:btn];
    [btn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = view;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 20;
    
}
- (void)back:(id)sender {
    Model(LoginViewController);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            Push(MineSetViewController);
        }
            break;
        case 1: {
            Push(MessageSetViewController);
        }
            break;
           
        case 2: {
//            Push(PrivacySetViewController);
            PrivacySetViewController *vc = [[PrivacySetViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
           
        case 3: {
            Push(FunctionViewController);
        }
            break;
           
        case 4: {
            Push(SafeSetViewController);
        }
            break;
        case 5: {
            Push(AboutSetViewController);
        }
            break;
        default: {
            [self alertshow];
        }
            break;
    }
}
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}
//清除缓存
-(float)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}
-(float)folderSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize;
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            folderSize +=[self fileSizeAtPath:absolutePath];
        }
        //SDWebImage框架自身计算缓存的实现
        //folderSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
        return folderSize;
    }
    return 0;
}
-(void)clearCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
}
- (void)alertshow {
    float cache =[self folderSizeAtPath:SF2(@"%@/%@", NSHomeDirectory(), @"Library/Caches")];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"通知" message:SF(@"缓存大小为%.2fM,确定清理缓存吗？",cache) preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancle];
    UIAlertAction *removeCache = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self clearCache:SF2(@"%@/%@", NSHomeDirectory(), @"Library/Caches")];
            [SVProgressHUD showSuccessWithStatus:@"清理成功"];
    }];
    [alert addAction:removeCache];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
