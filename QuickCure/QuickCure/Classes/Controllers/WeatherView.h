//
//  WeatherView.h
//  QuickCure
//
//  Created by hebing on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherView : UIView
@property(nonatomic,strong)NSArray* dataAry;
//里面不能实现界面跳转,需要用controller实现//转移后发现依然不能点击,查网上获取获得当前view的controller的方法
//@property(nonatomic,strong)UIButton* but_location;
@property(nonatomic,strong)UILabel* lb_dataData;
@property(nonatomic,copy) NSString* location;

@property(nonatomic,strong)NSNumber* item;

@end
