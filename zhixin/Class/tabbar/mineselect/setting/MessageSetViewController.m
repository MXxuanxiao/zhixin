//
//  MessageSetViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/2/1.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "MessageSetViewController.h"

@interface MessageSetViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *data;
@end

@implementation MessageSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息设置";
    // Do any additional setup after loading the view from its nib.
    self.data = [NSMutableArray array];
    for (int i  = 0; i < 10; i++) {
        NSString *str = SF(@"群组 - %d", i);
        [self.data addObject:str];
    }
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self.view addSubview:self.tableView];
    Delegate;
    self.tableView.tableHeaderView = self.headerView;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"useAgain"];
    self.tableView.tableFooterView = [UIView new];
    
}

#pragma mark --TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"useAgain"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@"icon44"];
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NG2(@"%lu",indexPath.row);
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:nil message:SF(@"%@设置", [self.data objectAtIndex:indexPath.row]) preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [sheet addAction:cancle];
    UIAlertAction * camera = [UIAlertAction actionWithTitle:@"接收消息 " style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NG(@"1");
    }];
    [sheet addAction:camera];
    
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"屏蔽群组" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NG(@"1");
    }];
    [sheet addAction:album];
    [self presentViewController:sheet animated:YES completion:nil];

}
@end
