//
//  HomeViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "HomeViewController.h"
#import "WeatherView.h"
#import "CityableViewController.h"
#import "DWInfiniteScrollView.h"
#define screemW    [UIScreen mainScreen].bounds.size.width
#define screemH    [UIScreen mainScreen].bounds.size.height

#define Wcolor [UIColor lightGrayColor]
@interface HomeViewController ()

@property(nonatomic,weak)WeatherView* wView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];

}

- (void)setupUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.barTintColor = kThemeColor;
    
    self.title = @"黑马快医";
    [self setWeatherView];
    
    [self setVideo];
    
    [self setMenue];
  
  }

-(void)setWeatherView{
    
    //导航栏高度+状态栏高度
    //    WeatherView* wView=[[WeatherView alloc]initWithFrame:CGRectMake(0, (44+20), screemW, 110)];
    WeatherView* wView=[[WeatherView alloc]init ];
    wView.backgroundColor=Wcolor;
    _wView=wView;
    [self.view addSubview:wView];
    //    wView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [wView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(0);
        make.left.equalTo(self.view.mas_left).offset(0);
        make.height.equalTo(@110);
        make.right.equalTo(self.view.mas_right).offset(0);
        
        
        
    }];
    
   
    
    
}

-(void)setVideo{
    
//    DWInfiniteScrollView* videoView=[[DWInfiniteScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.wView.frame), screemW, 150)];
     DWInfiniteScrollView* videoView=[[DWInfiniteScrollView alloc]initWithFrame:CGRectMake(0, 64+110, screemW, 200)];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    videoView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:videoView];
}

-(void)setMenue{
    
    UIButton *bloodBtn = [[UIButton alloc] init];
    bloodBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:bloodBtn];
    
    [bloodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    
    UIButton *orthopedicsBtn = [[UIButton alloc] init];
    orthopedicsBtn.backgroundColor = [UIColor colorWithRed:0.4773 green:0.3712 blue:1.0 alpha:1.0];
    [self.view addSubview:orthopedicsBtn];
    
    [orthopedicsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(bloodBtn.mas_trailing);
        make.bottom.equalTo(self.view);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    UIButton *commonwealBtn = [[UIButton alloc] init];
    commonwealBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:commonwealBtn];
    
    [commonwealBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(orthopedicsBtn.mas_trailing);
        make.bottom.equalTo(self.view);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    UIButton *tumourBtn = [[UIButton alloc] init];
    tumourBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:tumourBtn];
    
    [tumourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.bottom.equalTo(bloodBtn.mas_top);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    
    UIButton *cardiovascularBtn = [[UIButton alloc] init];
    cardiovascularBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:cardiovascularBtn];
    
    [cardiovascularBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(tumourBtn.mas_trailing);
        make.bottom.equalTo(orthopedicsBtn.mas_top);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    UIButton *neurologyBtn = [[UIButton alloc] init];
    neurologyBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:neurologyBtn];
    
    [neurologyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(cardiovascularBtn.mas_trailing);
        make.bottom.equalTo(commonwealBtn.mas_top);
        make.height.width.equalTo(@(screemW/3));
    }];

    
}



@end
