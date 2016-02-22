//
//  DdownLoadTableViewCell.h
//  zhixin
//
//  Created by yuxuezhi on 16/1/27.
//  Copyright © 2016年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DdownLoadTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
