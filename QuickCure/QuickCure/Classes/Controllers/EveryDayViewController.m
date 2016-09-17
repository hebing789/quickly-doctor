//
//  EveryDayViewController.m
//  QuickCure
//
//  Created by hebing on 16/9/17.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "EveryDayViewController.h"
#import "WeatherView.h"
#define Wcolor [UIColor colorWithRed:0.3772 green:0.7495 blue:0.6667 alpha:0.53]
@interface EveryDayViewController ()
@property(nonatomic,weak)WeatherView* wView;


@end

@implementation EveryDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //导航栏高度+状态栏高度
    
    UIView* lineColor= [[UIView alloc]initWithFrame:CGRectMake(0, 64, screemW, 150)];
    
    lineColor.backgroundColor=[UIColor colorWithRed:0.9399 green:0.6702 blue:0.9859 alpha:1.0];
    
//    UILabel* lable=[[UILabel alloc]init];
//    
//    lable.text=@"待获取数据绘制温度曲线,和去更多模型数据优化界面";
//    lable.textColor=[UIColor blueColor];
//    
//    lable.center=lineColor.center;
//    
//    [lineColor addSubview:lable];
    

    [self.view addSubview: lineColor];
        self.view.backgroundColor=[UIColor colorWithRed:1.0 green:0.9514 blue:0.221 alpha:1.0];
    int count=4;
    for (int i=0; i<count;i++) {
        WeatherView* wView=[[WeatherView alloc]initWithFrame:CGRectMake(0, (44+20+150)+((screemH-214)/count)*i, screemW, (screemH-214-count*2)/count)];
        //    WeatherView* wView=[[WeatherView alloc]init ];
        wView.backgroundColor=Wcolor;
        _wView=wView;
        _wView.location=self.location;
        _wView.backgroundColor=[UIColor colorWithRed:0.4679 green:1.0 blue:0.9013 alpha:1.0];
//        wView.lb_dataData.userInteractionEnabled=NO;//在里面修改
        wView.item=@(i);
        [self.view addSubview:wView];
        

    }
    
    
    
}



@end
