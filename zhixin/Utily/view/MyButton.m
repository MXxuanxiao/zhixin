//
//  MyButton.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/28.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        self.backgroundColor  = kWhite;
        self.icon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.width)];
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.width, frame.size.width, 25)];
        //self.title.textAlignment = 1;
        self.title.font = [UIFont systemFontOfSize:10];
        self.title.numberOfLines = 0;
        self.title.textColor = kLight;
        [self addSubview:self.icon];
        [self addSubview:self.title];
    }
    return self;
}
@end
