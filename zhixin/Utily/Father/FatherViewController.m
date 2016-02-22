//
//  FatherViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/21.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "FatherViewController.h"
#import "PopoverView.h"
#import "chatListViewController.h"
#import "SearchViewController.h"
#import "HelpCenterViewController.h"
#import "USViewController.h"
@interface FatherViewController ()

@end

@implementation FatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createitemButton];
    [self createNavColor];
    //设施导航栏标题颜色和字体
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{NSFontAttributeName:[UIFont systemFontOfSize:19],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//添加导航栏按钮
- (void)createitemButton {
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClick:)];
    [addBtn setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *scarch = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchClick:)];
    [scarch setTintColor:[UIColor whiteColor]];
    NSMutableArray *btns = [NSMutableArray array];
    [btns addObject:addBtn];
    [btns addObject:scarch];
    self.navigationItem.rightBarButtonItems = btns;
    
}

- (void)addClick:(id)sender {
    
    CGRect rectNav = self.navigationController.navigationBar.frame;
    CGPoint point = CGPointMake(rectNav.size.width-60, rectNav.size.height+20);
    NSArray *titles = @[@"扫一扫", @"通讯录",@"帮助中心",@"关于我们"];
    NSArray *images = @[@"icon58_58.png", @"icon58_58.png", @"icon58_58.png", @"icon58_58.png"];
    PopoverView *pop = [[PopoverView alloc] initWithPoint:point titles:titles images:images];
    pop.selectRowAtIndex = ^(NSInteger index){
        switch (index) {
            case 0:
                [Help scanWithViewController:self];
                break;
            case 1:{
                chatListViewController *vc = Alloc(chatListViewController);
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2:{
                HelpCenterViewController *vc = Alloc(HelpCenterViewController);
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3:{
                USViewController *vc = Alloc(USViewController);
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
    };
    [pop show];
    NSLog(@"111");
}

- (void)searchClick:(id)sender {
    NSLog(@"222");
    SearchViewController *search = Alloc(SearchViewController);
    [self presentViewController:search animated:YES completion:nil];
    
}

////设置导航栏标题
//- (void)createNavTitleWithString:(NSString *)strring {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 50, 25)];
//    label.text = strring;
//    label.textColor = [UIColor whiteColor];
//    label.textAlignment = 1;
//    [self.navigationController.navigationBar addSubview:label];
//}
//设置导航栏颜色
- (void) createNavColor {
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
}

@end
