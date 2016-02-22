//
//  MineViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "MineViewController.h"
#import "LearnViewController.h"
#import "DownloadViewController.h"
#import "FavourViewController.h"
#import "MoneyViewController.h"
#import "BusinessViewController.h"
#import "SettingViewController.h"
@interface MineViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *data;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [NSMutableArray array];
    [self createData];
    [self creatTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createData {
    NSArray *arr = @[@"学习进程",@"我的下载",@"我的收藏",@"智信财富",@"智信商学院",@"设置"];
    for (int i = 0; i< 6; i++) {
        NSDictionary *dict = @{@"name":[arr objectAtIndex:i],@"image":[UIImage imageNamed:@"icon58_58"]};
        [self.data addObject:dict];
    }
}
- (void)creatTableView {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    Delegate
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    
}
#pragma mark --UITableViewDelegate 

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            PushAndBool(LearnViewController, YES);
        }
  ;          break;
        case 1:
        {
            PushAndBool(DownloadViewController, YES);
        }
            break;
        case 2:
        {
            PushAndBool(FavourViewController, YES);
        }
            break;
        case 3:
        {
            PushAndBool(MoneyViewController, YES);
        }
            break;
        case 4:
        {
            Push(BusinessViewController);
        }
            break;
        case 5:
        {
            PushAndBool(SettingViewController, YES);
        }
            break;
            
        default:
            break;
    }
}
@end
