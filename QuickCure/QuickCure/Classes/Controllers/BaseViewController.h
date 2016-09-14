//
//  BaseViewController.h
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

//  ***********************【 侧滑 】**********************
/** 中间的指定VC */
- (UINavigationController *)centerNavigationController;

/** 左侧VC */
- (UIViewController *)leftMenuViewController;
/*
 *  侧滑调转到指定控制器
 */
- (void)jumpToOtherViewController:(UIViewController *)otherVC;
//  ***********************【 侧滑 】**********************

//为了子类用的，title字符串
//@property (nonatomic, copy) NSString *rowTitleString;

@end
