//
//  XinViewController.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "XinViewController.h"
#import <RongIMKit/RongIMKit.h>
#import "ChatListTableViewCell.h"
#import "ChatViewController.h"
#import "PopoverView.h"
#import "chatListViewController.h"
#import "SearchViewController.h"
#import "HelpCenterViewController.h"
#import "USViewController.h"
@interface XinViewController ()

@end

@implementation XinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"智信";
    [self setDisplayConversationTypeArray:@[@(ConversationType_PRIVATE),
                                            @(ConversationType_DISCUSSION),
                                            @(ConversationType_CHATROOM),
                                            @(ConversationType_GROUP),
                                            @(ConversationType_APPSERVICE),
                                            @(ConversationType_SYSTEM)]];
    self.conversationListTableView.tableFooterView = [UIView new];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, kWidth, 100)];
    label.text = @"暂时没有会话...";
    label.textAlignment = 1;
    self.emptyConversationView = label;
    [self createitemButton];
    [self createNavColor];
    //设施导航栏标题颜色和字体
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
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

-(void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    ChatViewController *conversationVC = [[ChatViewController alloc]init];
    conversationVC.conversationType =model.conversationType;
    conversationVC.targetId = @"100";
    //conversationVC.userName =model.conversationTitle;
    conversationVC.title = @"聊天";
    [self.navigationController pushViewController:conversationVC animated:YES];
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
}

- (void)searchClick:(id)sender {
    SearchViewController *search = Alloc(SearchViewController);
    [self presentViewController:search animated:YES completion:nil];
    
}
//设置导航栏颜色
- (void) createNavColor {
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
}

@end
