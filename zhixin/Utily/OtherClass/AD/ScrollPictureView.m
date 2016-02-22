//
//  ScrollPictureView.m
//  lunbo
//
//  Created by zhh on 15/12/17.
//  Copyright © 2015年 zhh. All rights reserved.
//

#import "ScrollPictureView.h"
#import <SDWebImage/SDWebImageOperation.h>
#import <SDWebImage/SDWebImageManager.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/UIView+WebCacheOperation.h>
#define Width (self.bounds.size.width)
#define Height (self.bounds.size.height)

@interface ScrollPictureView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *currentImageView;
@property (nonatomic, strong) UIImageView *defaultImageView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) BOOL isFire;
@end

@implementation ScrollPictureView
@synthesize pageControll = _pageControll;

- (instancetype)initWithFrame:(CGRect)frame images:(NSArray<UIImage *> *)images isAutoScroll:(BOOL)isAuto
{
    if (self = [super initWithFrame:frame]) {
        self.images = images;
        [self addSubview:self.scrollView];
        [self addImagesView];
        [self addSubview:self.pageControll];
        if (isAuto) {
            [self timer];
            self.isFire = YES;
        }
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

+ (void)scrollPictureViewWithFrame:(CGRect)frame urlStrings:(NSArray<NSString *> *)urlStrings isAutoScroll:(BOOL)isAuto block:(void(^)(ScrollPictureView *scrollPictureView))block
{
    ScrollPictureView *picView = [[ScrollPictureView alloc] init];
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i<urlStrings.count; i++) {
        UIImage *image = [UIImage imageNamed:@"image0"];
        [images addObject:image];
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_async(queue, ^{
        [urlStrings enumerateObjectsUsingBlock:^(NSString * _Nonnull urlString, NSUInteger idx, BOOL * _Nonnull stop) {
            NSURL *url = [NSURL URLWithString:urlString];
            id <SDWebImageOperation> operation = [SDWebImageManager.sharedManager downloadImageWithURL:url options:0 progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                static int i = 0;
                if (image!= nil) {
                     [images replaceObjectAtIndex:idx withObject:image];
                }
               
                i++;
                if (i >= urlStrings.count) {
                    i = 0;
                    dispatch_semaphore_signal(sem);
                }
            }];
            [picView sd_setImageLoadOperation:operation forKey:[NSString stringWithFormat:@"ImageLoad%ld",idx]];
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
        dispatch_async(dispatch_get_main_queue(), ^{
            block([[ScrollPictureView alloc] initWithFrame:frame images:images isAutoScroll:isAuto]);
        });
    });
}


- (void)dealloc
{
    [self.timer invalidate];
}

- (void)tap
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollPictureView:didSelectedItemAtIndex:)]) {
        [self.delegate scrollPictureView:self didSelectedItemAtIndex:[self imageIndexOfImageView:self.currentImageView]];
    }
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)color
{
    self.pageControll.currentPageIndicatorTintColor = color;
}

- (void)setPageIndicatorTintColor:(UIColor *)color
{
    self.pageControll.pageIndicatorTintColor = color;
}

- (void)setPageControllFrame:(CGRect)frame
{
    self.pageControll.frame = frame;
}

- (void)startScroll
{
    if (self.isFire) {
        return;
    }
    if (!_timer) {
        [self timer];
    }
    else {
        _timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:kTime];
        self.isFire = YES;
    }
}

- (void)pauseScroll
{
    if (!self.isFire || !_timer) {
        return;
    }
    _timer.fireDate = [NSDate distantFuture];
    self.isFire = NO;
}

- (void)next
{
    [self.scrollView scrollRectToVisible:CGRectMake(Width * 2, 0, Width, Height) animated:YES];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.alwaysBounceVertical = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(Width * 3, Height);
        _scrollView.contentOffset = CGPointMake(Width, 0);
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIPageControl *)pageControll
{
    if (_pageControll == nil) {
        _pageControll = [[UIPageControl alloc] init];
        _pageControll.numberOfPages = self.images.count;
    }
    return _pageControll;
}

- (NSTimer *)timer
{
    if (!_timer) {
//        _timer = [NSTimer scheduledTimerWithTimeInterval:kTime target:self selector:@selector(next) userInfo:nil repeats:YES];
        //如需在tableView的滚动中也让timer工作，只需打开下面的注释，将上面一句注释掉
        _timer = [NSTimer timerWithTimeInterval:kTime target:self selector:@selector(next) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

- (void)addImagesView
{
    self.currentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Width, 0, Width, Height)];
    self.currentImageView.image = self.images[0];
    [self.scrollView addSubview:self.currentImageView];
    
    self.defaultImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Width * 2, 0, Width, Height)];
    self.defaultImageView.image = self.images[1];
    [self.scrollView addSubview:self.defaultImageView];
}

- (NSInteger)imageIndexOfImageView:(UIImageView *)imageView
{
   return [self.images indexOfObject:imageView.image];
}

- (NSInteger)currentPageWithLeftImageView:(UIImageView *)leftImageView rightImageView:(UIImageView *)rightImageView
{
    return self.scrollView.contentOffset.x > Width * 1.5 ? [self imageIndexOfImageView:rightImageView] : [self imageIndexOfImageView:leftImageView];
}

#pragma mark - UIScorllViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x > Width) {
        self.defaultImageView.frame = CGRectMake(Width * 2, 0, Width, Height);
        //更改副imageView的image
        self.defaultImageView.image = self.images[([self imageIndexOfImageView:self.currentImageView] + 1) % self.images.count];
        //更改pageContorl的currentPage
        self.pageControll.currentPage = [self currentPageWithLeftImageView:self.currentImageView rightImageView:self.defaultImageView];
    }
    if (scrollView.contentOffset.x < Width) {
        self.defaultImageView.frame = CGRectMake(0, 0, Width, Height);
        self.defaultImageView.image = self.images[([self imageIndexOfImageView:self.currentImageView] + self.images.count - 1) % self.images.count];
        self.pageControll.currentPage = [self currentPageWithLeftImageView:self.defaultImageView rightImageView:self.currentImageView];
    }
    if ((scrollView.contentOffset.x >= Width *2) || (scrollView.contentOffset.x <= 0)) {
        self.scrollView.contentOffset = CGPointMake(Width, 0);
        self.currentImageView.image = self.defaultImageView.image;
        if (self.delegate && [self.delegate respondsToSelector:@selector(scrollPictureView:didScorllingAtIndex:)]) {
            
            [self.delegate scrollPictureView:self didScorllingAtIndex:[self imageIndexOfImageView:self.currentImageView]];
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self pauseScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startScroll];
}
@end








