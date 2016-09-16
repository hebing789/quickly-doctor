//
//  CaseCreateViewController.h
//  QuickCure
//
//  Created by 黄凯 on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaseCreateViewController : UIViewController


@property(nonatomic,copy) void(^dataBlock)(NSMutableArray* ary);

@end
