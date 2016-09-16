//
//  xinXueTableViewController.h
//  QuickCure
//
//  Created by 李亚 on 9/16/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xinXueTableViewController : UITableViewController

@property(nonatomic,copy) void(^dataBlock)(NSString* str);

//判读应该加载什么数据
@property(nonatomic,copy) NSString* title;

@end
