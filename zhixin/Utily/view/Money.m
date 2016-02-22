//
//  Money.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/27.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "Money.h"

@implementation Money

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:221/255.0 green:154/255.0 blue:63/255.0 alpha:1.0];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 18, 18)];
        [Help setImageCircular:label];
        label.backgroundColor = kWhite;
        label.textColor = [UIColor colorWithRed:221/255.0 green:154/255.0 blue:63/255.0 alpha:1.0];
        CGFloat x = self.center.x;
        CGFloat y = self.center.y;
        label.center = CGPointMake(x, y-30);
        label.textAlignment = 1;
        label.text = @"￥";
        [self addSubview:label];
        self.money = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 50)];
        self.money.textColor = kWhite;
        self.money.text = @"378.98";
        self.money.textAlignment = 1;
        self.money.font = [UIFont systemFontOfSize:20];
        self.money.center = self.center;
        [self addSubview:self.money];
        self.mark = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 20)];
        self.mark.font = [UIFont systemFontOfSize:10];
        self.mark.textColor = kWhite;
        self.mark.text = @"积分：35";
        self.mark.textAlignment = 1;
        self.mark.center = CGPointMake(x, y+30);
        [self addSubview:self.mark];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(kWidth-80, self.frame.size.height-30, 70, 20);
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn setTitle:@"立即充值" forState:UIControlStateNormal];
        [btn setTitleColor:kWhite forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:19/255.0 green:144/255.0 blue:47/155.0 alpha:1.0];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:btn];
    }
    return self;
}
- (void)click:(id)sender {
    NG(@"立即充值");
}
@end
