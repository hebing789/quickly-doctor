//
//  BaseViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor = WHITE_COLOR;
    self.navigationController.navigationBar.barTintColor = kThemeColor;
    
    [self setUpLeftButtonItem];
 
    
}

/*!
 *  默认修改了左上角的item值
 */
- (void)setUpLeftButtonItem{
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
}

/*!
 *  如果想任意跳转，就重写goBack方法
 */
- (void)goBack{
    
    [self.navigationController popViewControllerAnimated:YES];
}


//  ***********************【 侧滑 】**********************
/** 中间的nav */
- (UINavigationController *)centerNavigationController{
    
    return (UINavigationController *)self.sidePanelController.centerPanel;
}

/** 左侧VC */
//- (UIViewController *)leftMenuViewController{
//
//    return self.sidePanelController.leftPanel;
//}

- (void)jumpToOtherViewController:(UIViewController *)otherVC{
    
    //显示中间的panel
    [self.sidePanelController showCenterPanelAnimated:YES];
    
    //push到指定的VC
    [[self centerNavigationController] pushViewController:otherVC animated:NO];
}

@end
