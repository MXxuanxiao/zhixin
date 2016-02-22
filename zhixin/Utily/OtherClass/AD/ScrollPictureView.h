//
//  ScrollPictureView.h
//  lunbo
//
//  Created by zhh on 15/12/17.
//  Copyright © 2015年 zhh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScrollPictureViewDelegate;
@interface ScrollPictureView : UIView
@property (nonatomic, strong, readonly) UIPageControl *pageControll;
@property (nonatomic, assign) id <ScrollPictureViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<UIImage *> *)images isAutoScroll:(BOOL)isAuto;
+ (void)scrollPictureViewWithFrame:(CGRect)frame urlStrings:(NSArray<NSString *> *)urlStrings isAutoScroll:(BOOL)isAuto block:(void(^)(ScrollPictureView *scrollPictureView))block;
- (void)setPageControllFrame:(CGRect)frame;
- (void)setPageIndicatorTintColor:(UIColor *)color;
- (void)setCurrentPageIndicatorTintColor:(UIColor *)color;
- (void)startScroll;
- (void)pauseScroll;
@end

@protocol ScrollPictureViewDelegate <NSObject>
@optional
- (void)scrollPictureView:(ScrollPictureView *)scrollPictureView didSelectedItemAtIndex:(NSInteger)index;
- (void)scrollPictureView:(ScrollPictureView *)scrollPictureView didScorllingAtIndex:(NSInteger)index;
@end