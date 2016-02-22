//
//  MineFatherViewController.h
//  zhixin
//
//  Created by yuxuezhi on 16/1/27.
//  Copyright © 2016年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineFatherViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSMutableArray *data;
@property (nonatomic,assign) BOOL isTableView;
@property (nonatomic, strong)UITableView *tableView;
@end
