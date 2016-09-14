//
//  DWInfiniteScrollView.m
//  无限轮播封装
//
//  Created by shangshanbin on 16/8/12.
//  Copyright © 2016年 elenx. All rights reserved.
//

#import "DWInfiniteScrollView.h"

static int const ImageViewCount = 3;

@interface DWInfiniteScrollView () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) NSTimer *timer;

@end

@implementation DWInfiniteScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // 创建滚动视图
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        // 创建图片控件
        for (int i = 0; i < ImageViewCount; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [scrollView addSubview:imageView];
        }
        
        // 创建页码视图
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.userInteractionEnabled = NO;
        [self addSubview:pageControl];
        _pageControl = pageControl;
        
    }
    return self;
}

- (void)setImages:(NSArray<UIImage *> *)images {
    
    _images = images;
    
    // 设置起始页码
    self.pageControl.numberOfPages = images.count;
    self.pageControl.currentPage = 0;
    
    // 设置内容
    [self updateContent];
    
    // 开始定时器
    [self startTimer];
    
}

- (void)updateContent {
    
    // 设置图片
    for (int i = 0; i < ImageViewCount; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        NSInteger index = self.pageControl.currentPage;
        
        if (i == 0) {
            index --;
        } else if (i == 2) {
            index ++;
        }
        
        if (index < 0) {
            index = self.images.count - 1;
        } else if (index >= self.images.count) {
            index = 0;
        }
        
        imageView.tag = index;
        imageView.image = self.images[index];
    }
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
}

- (void)startTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    self.timer = timer;
}

- (void)nextPage {
    
    [self.scrollView setContentOffset:CGPointMake(2 * self.scrollView.frame.size.width, 0) animated:YES];
}

- (void)endTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(ImageViewCount * self.bounds.size.width, 0);
    
    for (int i = 0; i < ImageViewCount; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
        
        CGFloat pageW = self.images.count * 15;
        CGFloat pageH = 20;
        CGFloat pageX = self.bounds.size.width - pageW - 10;
        CGFloat pageY = self.bounds.size.height - pageH;
        self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    }
    
    // 修复一个起始画面的bug
    [self updateContent];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i < ImageViewCount; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        CGFloat distance = 0;
        
        distance = ABS(imageView.frame.origin.x - scrollView.contentOffset.x);
        
        if (distance < minDistance) {
            minDistance = distance;
            page = imageView.tag;
        }
    }
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self endTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self updateContent];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self updateContent];
}

@end
