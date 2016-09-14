//
//  DWInfiniteScrollView.h
//  无限轮播封装
//
//  Created by jerry on 16/8/12.
//  Copyright © 2016年 elenx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWInfiniteScrollView : UIView

@property (nonatomic, strong) NSArray<UIImage *> *images;

@property (nonatomic, weak, readonly) UIPageControl *pageControl;

@end
