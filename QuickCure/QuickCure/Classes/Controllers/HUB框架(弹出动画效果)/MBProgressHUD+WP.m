//
//  MBProgressHUD+WP.m
//  07-MBProgressHUD
//
//  Created by apple on 16/7/27.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MBProgressHUD+WP.h"


// 获取当前的 主window
#define kWindow ([UIApplication sharedApplication].keyWindow)

@implementation MBProgressHUD (WP)



#pragma mark
#pragma mark - 显示成功或者失败
+ (void)showMessageWith:(NSString *)message withSuccess:(BOOL)success afterDelay:(CGFloat)delay {
    
    
    // 实例化hud
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    
    // 显示文本
    hud.labelText = message;
    
    // 想要显示额外的imageView 就必须设置
    
    // 通过bool值进行判断, 使用哪张图片
    NSString *imageString = success ? @"MBProgressHUD.bundle/success" : @"MBProgressHUD.bundle/error";
    
    // 当图片文件放入 MBProgressHUD.bundle 的时候, 取图片的时候, 需要加上 bundle 文件名
    UIImage *image = [UIImage imageNamed:imageString];
    
    UIImageView *error = [[UIImageView alloc] initWithImage:image];
    
    hud.customView = error;
    
    // 修改hud的style
    hud.mode = MBProgressHUDModeCustomView;
    
    // 显示遮罩
    //这里改了NO  左旭改
    hud.dimBackground = NO;
    
    // 添加到view
    [kWindow addSubview:hud];
    
    // 显示出来
    [hud show:YES];
    
    // 如果不设置这个属性, 默认情况下, 当view隐藏的时候, 不会从父view上移除
    hud.removeFromSuperViewOnHide = YES;
    
    
    // 间隔一段时间之后消失
    [hud hide:YES afterDelay:delay];

    
}

#pragma mark
#pragma mark - 显示成功
+ (void)showSuccessMessage:(NSString *)message afterDelay:(CGFloat)delay {
    
    [self showMessageWith:message withSuccess:YES afterDelay:delay];
    
}

#pragma mark
#pragma mark - 显示错误

+ (void)showErrorMessage:(NSString *)message afterDelay:(CGFloat)delay {
    
    [self showMessageWith:message withSuccess:NO afterDelay:delay];
}

#pragma mark
#pragma mark - 显示加载信息
+ (void)showLoadingViewWithMesssage:(NSString *)message {
    
    // 实例化hud
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    
    // 显示文本
    hud.labelText = message;
    
    // 显示遮罩
    hud.dimBackground = NO;
    
    // 添加到view
    [kWindow addSubview:hud];
    
    // 显示出来
    [hud show:YES];
}


#pragma mark
#pragma mark - 隐藏所有的hud
+ (void)hidenAllHUDForWindow {
    
    
    [MBProgressHUD hideAllHUDsForView:kWindow animated:YES];
}

@end
