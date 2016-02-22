//
//  chatListViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/26.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "chatListViewController.h"
#import "ChatViewController.h"
@interface chatListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *data;
@end

@implementation chatListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"通讯录";
    // Do any additional setup after loading the view.
    [self createTableView];
    kNavBackColor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;

}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
- (void)createTableView {
    self.tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    Delegate;
    [self.view addSubview:self.tableView];
    self.tableView.rowHeight = 60;
//    self.tableView.separatorStyle = NO;
    self.tableView.tableFooterView = [UIView new];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strring = @"useAgain";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strring];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strring];
    }
    cell.textLabel.text = @"张三";
    cell.detailTextLabel.text = @"李四";
    cell.detailTextLabel.tintColor = kLight;
    cell.imageView.image = [UIImage imageNamed:@"icon58_58"];
    return cell;


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;

}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [@[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"] objectAtIndex:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatViewController *conversationVC = [[ChatViewController alloc]init];
    conversationVC.conversationType = ConversationType_PRIVATE;
    conversationVC.targetId = @"100";
    conversationVC.title = @"聊天";
    [self.navigationController pushViewController:conversationVC animated:YES];
}
@end
