//
//  CaseTypeController.h
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaseTypeController : UITableViewController

@property(nonatomic,copy) void(^dadaBlock)(NSString* str);

@property(nonatomic,assign) NSInteger item;

@end
