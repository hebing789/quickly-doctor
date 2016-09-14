//
//  VideoScrollView.m
//  QuickCure
//
//  Created by hebing on 16/9/14.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "VideoScrollView.h"
static int const ImageViewCount = 3;
@interface VideoScrollView()<UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, weak, readonly) UIPageControl *pageControl;
@property(nonatomic,strong)NSMutableArray* imgView;
@end

@implementation VideoScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        // 创建滚动视图
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsVerticalScrollIndicator = YES;
//        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = YES;
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
        self.pageControl.numberOfPages = self.dataAry.count;
        self.pageControl.currentPage = 0;
         [self startTimer];
    }
    return self;
}

- (void)updateContent {
    
//    // 设置图片
//    for (int i = 0; i < ImageViewCount; i++) {
//        UIImageView *imageView = self.scrollView.subviews[i];
//        NSInteger index = self.pageControl.currentPage;
//        
//        if (i == 0) {
//            index --;
//        } else if (i == 2) {
//            index ++;
//        }
//        
//        if (index < 0) {
//            index = self.dataAry.count - 1;
//        } else if (index >= self.dataAry.count) {
//            index = 0;
//        }
//        
//        imageView.tag = index;
//        imageView.image = self.dataAry[index];
//    }
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
}

-(NSMutableArray *)imgView{
    if (!_imgView) {
        _imgView=[NSMutableArray new];
    }
    return _imgView;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(ImageViewCount * self.bounds.size.width, 0);
    
    for (int i = 0; i < ImageViewCount; i++) {
        UIImageView *imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * self.bounds.size.width, 0, self.bounds.size.width, self.bounds.size.height);
        [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataAry[i]]];
        
//        [self startTimer];
        CGFloat pageW = self.dataAry.count * 15;
        CGFloat pageH = 20;
        CGFloat pageX = self.bounds.size.width - pageW - 10;
        CGFloat pageY = self.bounds.size.height - pageH;
        self.pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
        //这种思路不行
//        if (imageView) {
//            [self.imgView addObject:imageView];//断点看img为nil
//            
//        }
    }
    
    
    // 修复一个起始画面的bug
    [self updateContent];
    
}


-(NSMutableArray*)dataAry{
    if (_dataAry==nil) {
        
        
        _dataAry=[NSMutableArray arrayWithObjects:@"http://img.guahao.com/portal_upload/rollingnews/1453447883150.jpg",
                  @"http://img.guahao.com/portal_upload/mediafocus/1461826474435.jpg",
                  @"http://img.guahao.com/portal_upload/rollingnews/1461574027543.jpg", nil];
        
    }
    return _dataAry;
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
            // 修复一个起始画面的bug
//            [self updateContent];
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



@end
