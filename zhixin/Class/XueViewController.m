//
//  XueViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/21.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "XueViewController.h"
#import "LoginViewController.h"
#import "XueTableViewCell.h"
#import "MyButton.h"
#import "ScrollPictureView.h"
#import <MJRefresh.h>
#import "ClassifyViewController.h"
#import "CourseViewController.h"
#import "TestViewController.h"
#import "TeacherViewController.h"
@interface XueViewController ()<UITableViewDelegate,UITableViewDataSource,ScrollPictureViewDelegate>

//头视图
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (nonatomic, strong) ScrollPictureView *picView;
- (IBAction)btn0:(id)sender;
- (IBAction)btn1:(id)sender;
- (IBAction)btn9:(id)sender;


//尾视图
@property (weak, nonatomic) IBOutlet UIView *footerView;

@property (weak, nonatomic) IBOutlet UILabel *footerTitle;

//@property (nonatomic, strong)UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation XueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    //推出登录界面
//    Model(LoginViewController);
//    vc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self setbuttonView];
    [self creatLunbo];
    self.tableView.showsVerticalScrollIndicator = NO;
    @weakify_self
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify_self
        [self.tableView.mj_header endRefreshing];
    }];
}
- (void)click:(id)sender {
    NG(@"111");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self creatrTableView];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self.picView startScroll];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView = nil;
    [self.picView pauseScroll];
}

- (void)creatrTableView {
    Delegate;
    self.tableView.rowHeight = 128;
    self.tableView.tableFooterView = self.footerView;
    self.tableView.tableHeaderView = self.headerView;
    self.tableView.separatorStyle = NO;
    [self.view addSubview:self.tableView];
    UINib *nib = [UINib nibWithNibName:@"XueTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"XueTableViewCell"];
}
#pragma mark TableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XueTableViewCell"];
    if (indexPath.row == 0) {
        cell.name.text = @"最新课程";
    }else {
        cell.name.text = @"最热课程";
    }
    cell.scrollView.contentSize = CGSizeMake(860, 0);
    cell.scrollView.showsHorizontalScrollIndicator = NO;
    [self createMybuttonWithArray:nil andTag:indexPath.row inView:cell.scrollView];
    return cell;
}
- (void)createMybuttonWithArray:(NSArray*)array andTag:(NSInteger)row inView:(UIView*)view {
    for (int i = 0; i<10; i++) {
        MyButton *btn = [[MyButton alloc] initWithFrame:CGRectMake(10+(75+10)*i, 0, 75, 100)];
        btn.tag = (row+1)*1000+i;
        btn.icon.image = [UIImage imageNamed:@"icon58_58"];
        btn.title.text = @"qweqweqweqweqweqweqweqwe";
        [view addSubview:btn];
        [btn addTarget:self action:@selector(cellBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)cellBtn:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSLog(@"%lu",(long)btn.tag);
    //根据tag判断点击事件
    Push(CourseViewController);
    vc.titleValue = SF2(@"%lu-%lu", btn.tag/1000-1, btn.tag%1000);
}
#pragma mark 轮播
- (void)creatLunbo {
    NSArray *urlStrings = @[@"http://c.hiphotos.baidu.com/zhidao/pic/item/83025aafa40f4bfb39079bc1034f78f0f636184b.jpg",@"http://f.hiphotos.baidu.com/zhidao/wh%3D600%2C800/sign=496abfc08db1cb133e3c3415ed647a76/b7003af33a87e95048e8274310385343fbf2b426.jpg",@"http://f.hiphotos.baidu.com/zhidao/pic/item/a9d3fd1f4134970aed3ef2a594cad1c8a6865def.jpg",@"http://img.hb.aicdn.com/1903f15eda0147f04d2141a24c18510f4d46919911ef6-mr440R_fw580"];
    [ScrollPictureView scrollPictureViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120) urlStrings:urlStrings isAutoScroll:YES block:^(ScrollPictureView *scrollPictureView) {
        self.picView = scrollPictureView;
        self.picView.delegate = self;
        [self.picView setPageControllFrame:CGRectMake(kWidth-90, 95, 100, 30)];
        [self.picView setPageIndicatorTintColor:[UIColor yellowColor]];
        [self.picView setCurrentPageIndicatorTintColor:[UIColor redColor]];
        [self.headerView addSubview:self.picView];
    }];
}

- (void)scrollPictureView:(ScrollPictureView *)scrollPictureView didSelectedItemAtIndex:(NSInteger)index
{
    NG2(@"select -- %lu", (long)index);
    kSafari(@"www.baidu.com");
    NSString *uuid =[UIDevice currentDevice].identifierForVendor.UUIDString;
    NG2(@"%@", uuid);
    //选择的广告图片

}

#pragma mark btn Click
- (void)setbuttonView {
    for (UIView *subView in self.headerView.subviews) {
        if (subView.tag >= 100) {
            [Help setImageCircular:subView];
        }
    }
}

- (IBAction)btn0:(id)sender {
    Push(TeacherViewController);
}

- (IBAction)btn1:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSString *title = SF(@"分类%lu", btn.tag-99);
    Push(ClassifyViewController);
    vc.titleValue = title;
    
}


- (IBAction)btn9:(id)sender {
    Push(TestViewController);
}
@end
