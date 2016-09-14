//
//  ViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkTool.h"
#import "NetWorkDefine.h"

@interface ViewController ()

@end

@implementation ViewController

+(instancetype)sharedInstance{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance=[[self alloc]init];
    });
    
    return instance;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}




//15.获取关注医生列表接口 少了php 接口 （最后OK）
-(void)test15{
    
    //    请求地址: http://iosapi.itcast.cn/doctorList.json
    //    请求参数:{"user_id":1000089,"page_size":15,"page":1}
    
    NSString *urlString = kDoctorListUrl;
    NSDictionary *paramDic = @{
                               @"user_id":@"1000089",
                               @"page_size":@15,
                               @"page":@1
                               };
    
    
    [self loadUrl:urlString params:paramDic];
    
    //    error = Error Domain=NSCocoaErrorDomain Code=3840 "JSON text did not start with array or object and option to allow fragments not set." UserInfo={NSDebugDescription=JSON text did not start with array or object and option to allow fragments not set.}
    
    //    少了 php
    
    
}

//14.取消关注医生接口  接口少了php  （最后 OK ）
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-(void)test14{
    //    请求地址: http://iosapi.itcast.cn/deleteDoctor.json.php
    //    请求参数:{"user_id":1000089,"doctor_id":300000315}
    
    NSString *urlString = kDeleteDoctorUrl;
    NSDictionary *paramDic = @{
                               @"user_id":@"1000089",
                               @"doctor_id":@300000315
                               };
    
    [self loadUrl:urlString params:paramDic];
}

//13.关注医生  OK
-(void)test13{
    
    NSString *urlString = kAddDoctorUrl;
    NSDictionary *paramDic = @{
                               @"user_id":@"1000089",
                               @"doctor_id":@300000315
                               };
    
    
    [self loadUrl:urlString params:paramDic];
    
    
}

//12.天气 （最后OK） 接口不对
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
-(void)test12{
    
    //#define kBDWeather_KEY @"17IvzuqmKrK1cGwNL6VQebF9"
    //#define kGetWeather_URL(city) ([NSString stringWithFormat: @"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=%@", city, kBDWeather_KEY])
    
    NSString *city = @"上海";
    NSString *url = @"http://api.map.baidu.com/telematics/v3/weather";
    
    NSDictionary *paramDic = @{@"location":city,
                               @"output":@"json",
                               @"ak":@"17IvzuqmKrK1cGwNL6VQebF9"
                               };
    
    [[NetWorkTool shareManager] GET_RequestWithUrlString:url parmas:paramDic successBloock:^(id responseObject) {
        
        NSLog(@"天气= %@",responseObject);
    } failureBlock:^(NSError *error) {
        
        NSLog(@"天气错误= %@",error);
    }];
    
    
    
}

//11.获取医生就诊时间接口
/*!
 *  接口有问题：后面少个php
 */
-(void)test11{
    
    //请求地址: http://iosapi.itcast.cn/doctorReceivingSetting.json.php
    //    请求参数:{"doctor_id":300000315}
    
    NSString *urlString = kDoctorDuties;
    NSDictionary *paramDic = @{
                               @"doctor_id":@300000315
                               };
    
    
    [self loadUrl:urlString params:paramDic];
    
}

//10.医生简介接口 OK
-(void)test10{
    
    //请求地址: http://iosapi.itcast.cn/doctorReceivingSetting.json.php
    //    请求参数:{"doctor_id":300000315}
    
    NSString *urlString = kGetIntroductionUrl;
    NSDictionary *paramDic = @{
                               @"doctor_id":@300000315
                               };
    
    
    [self loadUrl:urlString params:paramDic];
}

//9. 匹配到医生后，查看医生接诊条件  OK
-(void)test9{
    
    //请求地址: http://iosapi.itcast.cn/doctorReceivingSetting.json.php
    //    请求参数:{"doctor_id":300000315}
    
    NSString *urlString = kDoctorReceivingSetting;
    NSDictionary *paramDic = @{
                               @"doctor_id":@300000315
                               };
    
    
    [self loadUrl:urlString params:paramDic];
    
}


//8.获取医生基本信息接口 OK
-(void)test8{
    
    //   doctor_id 医生编号
    //    请求地址: http://iosapi.itcast.cn/getDoctorInfo.json.php
    //    请求参数:{"user_id":1000089,"doctor_id":300000315}
    
    NSString *urlString = kGetDoctorInfoUrl;
    NSDictionary *paramDic = @{@"user_id":@1000089,
                               @"doctor_id":@300000315 //@200000094
                               };
    
    
    [self loadUrl:urlString params:paramDic];
    
    
    
}

//7.获取医生列表接口 OK
-(void)test7{
    
    //    {"ci1_id":1,"ci2_id":3,"ci3_id":3,"diagnosis_type":0,"page_size":15,"is_confirmed":1,"user_id":1000089, "page":1,"has_diagnosis":2}
    NSString *urlString = kMatchDoctors;
    NSDictionary *paramDic = @{@"ci1_id":@1,
                               @"ci2_id":@3,
                               @"ci3_id":@3,
                               @"diagnosis_type":@0,
                               @"page_size":@15,
                               @"is_confirmed":@1,
                               @"user_id":@1000089,
                               @"page":@1,
                               @"has_diagnosis":@2
                               };
    
    
    [self loadUrl:urlString params:paramDic];
    
}

//6.选择并发症列表接口 OK
//放弃………………
-(void)test6{
    
    //    请求参数:{"page":1,"page_size":15,"ci2_id":3}
    NSString *urlString = kComplicationListUrl;
    NSDictionary *paramDic = @{@"page":@1,@"page_size":@15,@"ci2_id":@3
                               };
    
    [self loadUrl:urlString params:paramDic];
}

//5 . 半 OK  这些数据都是死的
-(void)test5{
    
    /*
     接口注意： 这些数据都是死的
     
     */
    
    NSString *urlString = kMatchedDoctorCountUrl;
    NSDictionary *paramDic = @{@"ci1_id":@1,
                               @"ci2_id":@3,
                               @"ci3_id":@3,
                               @"diagnosis_type":@0,
                               @"is_confirmed":@1,
                               @"user_id":@1000089,
                               @"has_diagnosis":@2
                               };
    
    
    [self loadUrl:urlString params:paramDic];
    
}

//4. 肿瘤疾病选择疾病细分列表接口  OK
-(void)test4{
    //    请求地址: http://iosapi.itcast.cn/searchCI3List.json.php
    //    请求参数:{"page":1,"page_size":15,"ci1_id":1,"keyword":""}
    
    NSString *urlString = kSearchCI3Url;
    NSDictionary *paramDic = @{
                               @"page_size":@15,
                               @"page":@1,
                               @"ci1_id":@1,
                               @"keyword":@""
                               };
    
    [self loadUrl:urlString params:paramDic];
}

//2.首页轮播页有误 ( 改后 OK )，可以自己选择两个图片
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// 参数改我这样的就好了！
-(void)test2{
    
    
    //url数组
    NSArray *imageArray = @[
                            @"http://img.guahao.com/portal_upload/rollingnews/1453447883150.jpg",
                            @"http://img.guahao.com/portal_upload/mediafocus/1461826474435.jpg",
                            @"http://img.guahao.com/portal_upload/rollingnews/1461574027543.jpg"
                            ];
    
    
    
    
    NSString *urlString = kBannersUrl;
    NSDictionary *paramDic = @{
                               @"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f",
                               @"page_size":@10,
                               @"page":@1};
    
    
    [self loadUrl:urlString params:paramDic];}


// 1.登录 OK user_id = 1000089;
-(void)test1{
    
    
    NSString *urlString = kLoginUrl;
    NSDictionary *paramDic = @{@"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f"};
    
    //    NSDictionary *paramDic = @{@"login_token":@"985c96ce43bb5ef69de3e1ad8afaa83f",@"user_id":@(11),@"true_name":@"test",@"card_number":@"111",@"card_type":@(11)};
    
    [self loadUrl:urlString params:paramDic];
}

/** 最后统一测试的 */
-(void)loadUrl:(NSString *)urlString
        params:(NSDictionary *)paramDic{
    
    [[NetWorkTool shareManager] POST_RequestWithUrlString:urlString parmas:paramDic successBloock:^(id responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
    } failureBlock:^(NSError *error) {
        
        NSLog(@"error = %@",error);
    }];
    
}

/*
 //#疾病细分接口-------------------------------------------------
 // 肿瘤     ci1_id = 1
 // 心血管   ci1_id = 2
 // 神经科   ci1_id = 3
 // 血液科   ci1_id = 4
 // 骨科     ci1_id = 5
 // 公益活动  ci1_id = 6
 */
@end
