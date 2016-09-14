//
//  CityableViewController.h
//  QuickCure
//
//  Created by hebing on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityableViewController : UITableViewController
//需要赋值,成公有属性
@property(nonatomic,strong)NSArray* dataAry;

@property(nonatomic,copy) NSString* useId;

@property(nonatomic,copy) void(^locBlock)(NSString* location,long long int item) ;
@end
