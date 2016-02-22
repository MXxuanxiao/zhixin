//
//  MyButton.h
//  zhixin
//
//  Created by yuxuezhi on 16/1/28.
//  Copyright © 2016年 MX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyButton : UIButton
@property (nonatomic,strong)UIImageView *icon;
@property (nonatomic,strong)UILabel *title;
- (instancetype)initWithFrame:(CGRect)frame;
@end
