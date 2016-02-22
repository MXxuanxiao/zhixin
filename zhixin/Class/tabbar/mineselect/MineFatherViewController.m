//
//  MineFatherViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/27.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "MineFatherViewController.h"
#import "HttpRequest.h"
#import <MJRefresh.h>
@interface MineFatherViewController ()

@end

@implementation MineFatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kWhite;
    self.data = [NSMutableArray array];
    [self createTableView];
//    [self createEditButton];
    kNavBackColor;
    self.tableView.showsVerticalScrollIndicator = NO;
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    Delegate;
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //删除单元格
//    [self.data removeObjectAtIndex:indexPath.row];
//    [self.tableView reloadData];
}
@end
