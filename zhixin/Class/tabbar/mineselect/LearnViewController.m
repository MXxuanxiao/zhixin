//
//  LearnViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/27.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "LearnViewController.h"
#import "CourseListTableViewCell.h"
#import <MJRefresh.h>
@interface LearnViewController ()

@end

@implementation LearnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"学习进程";
    // Do any additional setup after loading the view from its nib.
    UINib *nib = [UINib nibWithNibName:@"CourseListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CourseListTableViewCell"];
    self.tableView.rowHeight = 60;
    @weakify_self
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify_self
        [self.tableView.mj_header endRefreshing];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CourseListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CourseListTableViewCell"];
    cell.name.text = @"[张三]杭三李四";
    return cell;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
