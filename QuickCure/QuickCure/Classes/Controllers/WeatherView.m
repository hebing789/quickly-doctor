//
//  WeatherView.m
//  QuickCure
//
//  Created by hebing on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "WeatherView.h"
#import "BaseViewController.h"

#define WeaColor [UIColor colorWithRed:0.0939 green:0.7285 blue:0.5893 alpha:1.0]
#define KFontSize [UIFont systemFontOfSize:14]
@interface WeatherView()

@property(nonatomic,strong)UIImageView* ImgView_wea;

@property(nonatomic,strong)UILabel* lb_wea;


@property(nonatomic,strong)UILabel* lb_tem;

@property(nonatomic,strong)UILabel* lb_data;

@property(nonatomic,strong)UILabel* lb_temdata;

@property(nonatomic,strong)UILabel* lb_dataData;

@property(nonatomic,strong)UIButton* but_location;


@end
#import "WeatherModel.h"
#import "CityableViewController.h"

@implementation WeatherView

-(void)setLocation:(NSString *)location{
    _location=location;
    
//    重新获取数据
    
    [WeatherModel modelWithSucess:^(NSArray *ary) {
        //解决bug
        if(ary.count!=0&&ary)
        {
            self.dataAry=ary;
        }
        
    } andError:^{
        
    } andWithLocation:self.location];
    
}

//刷新
-(void)setDataAry:(NSArray *)dataAry{
    _dataAry=dataAry;
    
    //后面发现item没有用,每个数组里面的日期排布顺序不一样
//    时事数据计算
    NSDate* date=[NSDate date];

    NSDateFormatter* formatter=[[NSDateFormatter alloc]init];
    
    formatter.dateFormat=@"dd";
    
    NSString* datastring=[formatter stringFromDate:date];
    
//    NSLog(@"%@",datastring);
    
    WeatherModel* model;
    for (WeatherModel* temmodel in dataAry) {
        
        if ([temmodel.date containsString:datastring]) {
            model=temmodel;
        }
    }
    
    if (!model) {
        model=self.dataAry[0];
    }
    //数组第一个数据就可以
    
//    NSLog(@"%@",model);
    
    //天气图片
    [_ImgView_wea sd_setImageWithURL:[NSURL URLWithString:model.dayPictureUrl]];
    
     _lb_wea.text=model.weather;
    
    [_but_location setTitle: _location forState:UIControlStateNormal];
    

    
    _lb_temdata.text=model.temperature;
    
    _lb_dataData.text=model.temDate;
    //刷新数据的时候不会重新调用layoutsubbiews
    [self makeSizeFit];

}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame ]) {
         [self setUI];
    }

    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
   
    [self makeSizeFit];
}
-(void)makeSizeFit{
    _ImgView_wea.center=CGPointMake(0, self.height/2);//这个+10才好看
    
    _ImgView_wea.x=15;
    [_lb_wea sizeToFit];
    
    _lb_wea.center=CGPointMake(0, self.height/2);
    
    _lb_wea.x=CGRectGetMaxX(_ImgView_wea.frame)+10;
    
    [_but_location sizeToFit];
    
    _but_location.center=CGPointMake(0, self.height/2);
    _but_location.x=CGRectGetMaxX(_lb_wea.frame)+20;
    
    [_lb_temdata sizeToFit];
    
        if (CGRectGetMaxX(_but_location.frame)>screemW/2) {
            _but_location.x= _but_location.x=CGRectGetMaxX(_lb_wea.frame)+8;
    
        }
    
    _lb_temdata.center=CGPointMake(0, self.height/4);
    
    _lb_temdata.x=screemW-30-_lb_temdata.width;
    
    [_lb_tem sizeToFit];
    
    //        _lb_tem.center=CGPointMake(0, 10);
    _lb_tem.center=CGPointMake(0, self.height/4);
    
    _lb_tem.x=CGRectGetMinX(_lb_temdata.frame)-10-_lb_tem.width;
    
    [_lb_dataData sizeToFit];
    
    _lb_dataData.center=CGPointMake(0, self.height-10-_lb_dataData.height);
    
    _lb_dataData.x=screemW-10-_lb_dataData.width;
    
    [_lb_data sizeToFit];
    
    _lb_data.center=CGPointMake(0,self.height-10-_lb_dataData.height );
    
    _lb_data.x=CGRectGetMinX(_lb_dataData.frame)-10-_lb_data.width;
    
    

    
}
-(void)setUI{
//        self.backgroundColor=[UIColor redColor];
    
    _location=@"上海";
    [WeatherModel modelWithSucess:^(NSArray *ary) {
        
        
        
        self.dataAry = ary;
        WeatherModel* model=self.dataAry[0];
//        NSLog(@"%@",model);
      
        UIView* centerMargin=[[UIView alloc]init];
        centerMargin.frame=CGRectMake(screemW/2-0.75, 10, 1.5, self.height-20);
        centerMargin.backgroundColor=[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
        [self addSubview:centerMargin];
           _ImgView_wea=[[UIImageView alloc]init];
        
        //天气图片
        [_ImgView_wea sd_setImageWithURL:[NSURL URLWithString:model.dayPictureUrl]];
        
        _ImgView_wea.bounds=CGRectMake(0, 0, 40, 40);
       
//        _ImgView_wea.y=self.height/2;//这个不算设置中心,不好看
        
        [self addSubview:_ImgView_wea];
        //天气lable
        _lb_wea=[[UILabel alloc]init];
        _lb_wea.text=model.weather;
        
        _lb_wea.textAlignment=NSTextAlignmentLeft;
        
        _lb_wea.textColor=WeaColor;
        
        _lb_wea.font=KFontSize;
        
        
        
//        NSAttributedString* abstring=[NSAttributedString alloc]initWithString:nil attributes:{NSFontAttributeName,}];
//        [_lb_wea setAttributedText:abstring];
        
//        _lb_wea.y=self.height/2;
        [self addSubview:_lb_wea];
        
        
        
        //地点lable
        _but_location=[[UIButton alloc]init];
        
        
        
//        _location=@"大理";//刚开始需要一个布局frame;
        [_but_location setTitle:_location forState:UIControlStateNormal];

        [_but_location setTitleColor:WeaColor forState:UIControlStateNormal];
        
        _but_location.titleLabel.font= KFontSize;
        
        [self addSubview:_but_location];
        
        [_but_location addTarget:self action:@selector(toCity) forControlEvents:UIControlEventTouchUpInside];
        

        
//
        //温度数据
        _lb_temdata=[[UILabel alloc]init];
        _lb_temdata.text=model.temperature;
        
        _lb_temdata.textAlignment=NSTextAlignmentLeft;
        
        _lb_temdata.textColor=WeaColor;
        
        _lb_temdata.font= KFontSize;
        
        
        //        _lb_temdata.y=self.height/2;
        [self addSubview:_lb_temdata];
        

        //温度
        _lb_tem=[[UILabel alloc]init];
        _lb_tem.text=@"温度";
        
        _lb_tem.textAlignment=NSTextAlignmentLeft;
        
        _lb_tem.textColor=WeaColor;
        
        _lb_tem.font= KFontSize;

    
        [self addSubview:_lb_tem];
        
        //日期数据
        
        _lb_dataData=[[UILabel alloc]init];
        _lb_dataData.text=model.temDate;
        
        _lb_dataData.textAlignment=NSTextAlignmentLeft;
        
        _lb_dataData.textColor=WeaColor;
        _lb_dataData.font= KFontSize;

        
        [self addSubview:_lb_dataData];
        

        
        
        //日期
        _lb_data=[[UILabel alloc]init];
        _lb_data.text=@"日期";
        
        _lb_data.textAlignment=NSTextAlignmentLeft;
        
        _lb_data.textColor=WeaColor;
        
        _lb_data.font= KFontSize;

        [self addSubview:_lb_data];
        
        
        
        
//        NSLog(@"%@",self.dataAry);
       
    } andError:^{
        
    } andWithLocation:self.location];
    
    
    
}

////取不到present 或nacontrol
-(void)toCity{
    
    CityableViewController* cityController=[[CityableViewController alloc]init];
    
    
    [cityController setLocBlock:^(NSString *location,long long int item) {
        
        self.location =location;
        
        self.item=item;
//        
//        [[self viewController].navigationController popToViewController:[self viewController] animated:YES];
//
        
        
        [[self viewController].navigationController popToRootViewControllerAnimated:YES];
       
    }];
    //不好看
//    UINavigationController* nv=[[UINavigationController alloc]initWithRootViewController:cityController];
//    
//       [[self viewController] presentViewController:nv animated:YES completion:nil];
    
    [[self viewController].navigationController pushViewController:cityController animated:YES];
    
//    必须继承与baseUivewcontrller的才有这个方法,由于,用的uivew写的,不具有这个功能
//     [[self viewController] jumpToOtherViewController:cityController];
}


- (UIViewController *)viewController
{
    //获取当前view的superView对应的控制器
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
    
}

@end
