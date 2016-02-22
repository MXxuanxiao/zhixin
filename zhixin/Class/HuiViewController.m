//
//  HuiViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "HuiViewController.h"
#import "HuiTableViewCell.h"
#import <MJRefresh.h>
@interface HuiViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation HuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
    [self createBarBtn];
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor = kBlack;
    @weakify_self
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify_self
        [self.tableView.mj_header endRefreshing];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
      @strongify_self
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark barBtn 
- (void)createBarBtn {
    UIBarButtonItem *publish = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(publish:)];
    [publish setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = publish;
}

- (void)publish:(id)sender {
    NG(@"1");
}

#pragma mark tabelView
- (void)createTableView {
    self.tableView  = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 200;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 225)];
    imageView.image = [UIImage imageNamed:@"header"];
    self.tableView.sectionHeaderHeight = 225;
    self.tableView.tableHeaderView = imageView;
    UINib *nib = [UINib nibWithNibName:@"HuiTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"HuiTableViewCell"];
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HuiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HuiTableViewCell"];
    return cell;
}
@end
