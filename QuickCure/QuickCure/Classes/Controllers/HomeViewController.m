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

#define Wcolor [UIColor colorWithRed:0.3772 green:0.7495 blue:0.6667 alpha:0.53]
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
        make.height.equalTo(@90);
        make.right.equalTo(self.view.mas_right).offset(0);
        
        
        
    }];
    
   
    
    
}

-(void)setVideo{
    
//    DWInfiniteScrollView* videoView=[[DWInfiniteScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.wView.frame), screemW, 150)];
     DWInfiniteScrollView* videoView=[[DWInfiniteScrollView alloc]initWithFrame:CGRectMake(0, 64+90, screemW, 200)];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    videoView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:videoView];
}

-(void)setMenue{
    /**
     *  血液科
     */
    UIButton *bloodBtn = [[UIButton alloc] init];
    [self.view addSubview:bloodBtn];
    bloodBtn.layer.borderWidth = 1;
    bloodBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    bloodBtn.adjustsImageWhenHighlighted = NO;
    
    [bloodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    [bloodBtn setImage:[UIImage imageNamed:@"xy"] forState:UIControlStateNormal];
    bloodBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 22, 0, 0);
    [bloodBtn setTitle:@"血液科" forState:UIControlStateNormal];
    [bloodBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bloodBtn.titleEdgeInsets = UIEdgeInsetsMake(70, -50, 0, 0);
    
    [bloodBtn addTarget:self action:@selector(pushController:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  骨科
     */
    UIButton *orthopedicsBtn = [[UIButton alloc] init];
    [self.view addSubview:orthopedicsBtn];
    orthopedicsBtn.layer.borderWidth = 1;
    orthopedicsBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    orthopedicsBtn.adjustsImageWhenHighlighted = NO;
    
    [orthopedicsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(bloodBtn.mas_trailing);
        make.bottom.equalTo(self.view);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    [orthopedicsBtn setImage:[UIImage imageNamed:@"gt"] forState:UIControlStateNormal];
    orthopedicsBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 36, 0, 0);
    [orthopedicsBtn setTitle:@"骨科" forState:UIControlStateNormal];
    [orthopedicsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    orthopedicsBtn.titleEdgeInsets = UIEdgeInsetsMake(70, -50, 0, 0);
    
    [orthopedicsBtn addTarget:self action:@selector(pushController:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  公益
     */
    UIButton *commonwealBtn = [[UIButton alloc] init];
    [self.view addSubview:commonwealBtn];
    commonwealBtn.layer.borderWidth = 1;
    commonwealBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    commonwealBtn.adjustsImageWhenHighlighted = NO;
    
    [commonwealBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(orthopedicsBtn.mas_trailing);
        make.bottom.equalTo(self.view);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    [commonwealBtn setImage:[UIImage imageNamed:@"gy"] forState:UIControlStateNormal];
    commonwealBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 36, 0, 0);
    [commonwealBtn setTitle:@"公益" forState:UIControlStateNormal];
    [commonwealBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    commonwealBtn.titleEdgeInsets = UIEdgeInsetsMake(70, -50, 0, 0);
    
    [commonwealBtn addTarget:self action:@selector(pushController:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  肿瘤
     */
    UIButton *tumourBtn = [[UIButton alloc] init];
    [self.view addSubview:tumourBtn];
    tumourBtn.layer.borderWidth = 1;
    tumourBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    tumourBtn.adjustsImageWhenHighlighted = NO;
    
    [tumourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.bottom.equalTo(bloodBtn.mas_top);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    [tumourBtn setImage:[UIImage imageNamed:@"zl"] forState:UIControlStateNormal];
    tumourBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 36, 0, 0);
    [tumourBtn setTitle:@"肿瘤" forState:UIControlStateNormal];
    [tumourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    tumourBtn.titleEdgeInsets = UIEdgeInsetsMake(70, -50, 0, 0);
    
    [tumourBtn addTarget:self action:@selector(pushController:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  心血管
     */
    UIButton *cardiovascularBtn = [[UIButton alloc] init];
    [self.view addSubview:cardiovascularBtn];
    cardiovascularBtn.layer.borderWidth = 1;
    cardiovascularBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    cardiovascularBtn.adjustsImageWhenHighlighted = NO;
    
    [cardiovascularBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(tumourBtn.mas_trailing);
        make.bottom.equalTo(orthopedicsBtn.mas_top);
        make.height.width.equalTo(@(screemW/3));
    }];
    
    [cardiovascularBtn setImage:[UIImage imageNamed:@"xyg"] forState:UIControlStateNormal];
    cardiovascularBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, -52);
    [cardiovascularBtn setTitle:@"心血管" forState:UIControlStateNormal];
    [cardiovascularBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cardiovascularBtn.titleEdgeInsets = UIEdgeInsetsMake(70, -50, 0, 0);
    
    [cardiovascularBtn addTarget:self action:@selector(pushController:) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  神经科
     */
    UIButton *neurologyBtn = [[UIButton alloc] init];
    [self.view addSubview:neurologyBtn];
    neurologyBtn.layer.borderWidth = 1;
    neurologyBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    neurologyBtn.adjustsImageWhenHighlighted = NO;
    
    [neurologyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(cardiovascularBtn.mas_trailing);
        make.bottom.equalTo(commonwealBtn.mas_top);
        make.height.width.equalTo(@(screemW/3));
    }];

    [neurologyBtn setImage:[UIImage imageNamed:@"sj"] forState:UIControlStateNormal];
    neurologyBtn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, -52);
    [neurologyBtn setTitle:@"神经科" forState:UIControlStateNormal];
    [neurologyBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    neurologyBtn.titleEdgeInsets = UIEdgeInsetsMake(70, -50, 0, 0);
    
    [neurologyBtn addTarget:self action:@selector(pushController:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushController:(UIButton *)button
{
    NSLog(@"----------------------%@",button.titleLabel.text);
}

@end
