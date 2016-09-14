//
//  MBProgressHUD+WP.h
//  07-MBProgressHUD
//
//  Created by apple on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (WP)

//+ (void)showMessageWith:(NSString *)message withSuccess:(BOOL)success afterDelay:(CGFloat)delay;


/**
 显示正确加载信息
 */
+ (void)showSuccessMessage:(NSString *)message afterDelay:(CGFloat)delay;



/**
 显示错误加载信息
 */
+ (void)showErrorMessage:(NSString *)message afterDelay:(CGFloat)delay;


/**
 显示加载信息
 */
+ (void)showLoadingViewWithMesssage:(NSString *)message;



/**
 隐藏window中所有的hud
 */
+ (void)hidenAllHUDForWindow;


@end
