//
//  WeatherModel.m
//  QuickCure
//
//  Created by hebing on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "WeatherModel.h"
#import "NetWorkTool.h"
#import "NetWorkDefine.h"
@implementation WeatherModel
- (instancetype)initWithDict:(NSDictionary *)dict{
    
    //完成初始化
    self = [super init];
    
    //判断对象是否存在
    if (self) {
        
        //使用KVC的方式设置数据
        [self setValuesForKeysWithDictionary:dict];
    }
    
    //返回当前对象
    return self;
    
}

/**
 *  对象初始化方法,类方法
 *
 *  @param dict 传入字典数据
 *
 *  @return 返回当前类的对象
 */
+ (instancetype)modelWithDict:(NSDictionary *)dict{
    
    //调用上方的方法完成初始化
    return [[self alloc]initWithDict:dict];
}

/**
 *  根据plist文件返回一个模型数组
 *
 *  @param fileName 传入plist文件的名字
 *
 *  @return 模型数组
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(NSString *)description{
    
    return [NSString stringWithFormat:@"%@ {weather =%@,temperature=%@}",[super description],self.weather,self.temperature];
    
}
+(void)modelWithSucess:(void (^)(NSArray *))sucessBlock andError:(void (^)())errorBlock andWithLocation:(NSString*)location{
    
    NSString *city = location;
//    NSString *city = @"大理";
    NSString *url = @"http://api.map.baidu.com/telematics/v3/weather";
    
    NSDictionary *paramDic = @{@"location":city,
                               @"output":@"json",
                               @"ak":@"17IvzuqmKrK1cGwNL6VQebF9"
                               };
    
    [[NetWorkTool shareManager] GET_RequestWithUrlString:url parmas:paramDic successBloock:^(NSDictionary* responseObject) {
        
//        NSLog(@"%@",responseObject);
        NSMutableArray* mArry=[NSMutableArray new];
        //                NSString* rootKey=responseObject.keyEnumerator.nextObject;
        //        NSLog(@"%@",rootKey);//status
        //                NSArray* arry=responseObject[rootKey];
        
        NSArray* arry=responseObject[@"results"];
        
        NSDictionary* obj=arry.lastObject;
        
        
        
                    NSLog(@"%@",obj);
        
        //            NSString* rootKey=responseObject.keyEnumerator.nextObject;
        //                    NSLog(@"%@",rootKey);//status
        //            NSDictionary* dic=obj[rootKey];
        //             NSLog(@"%@",dic);
        //              NSString* rootKey=dic.keyEnumerator.nextObject;
        NSArray* tem=obj[@"weather_data"];
        [tem enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            WeatherModel* model=[WeatherModel modelWithDict:obj];
            [mArry addObject:model];
            
        }];
        
        if(sucessBlock) {
            sucessBlock(mArry.copy);
        }
        
        
        //        NSLog(@" %@",responseObject);
    } failureBlock:^(NSError *error) {
        if (errorBlock) {
            errorBlock();
        }
        
        NSLog(@"天气错误= %@",error);
    }];
    
    
}
//


-(NSString *)temDate{
    NSString* tem;
    if (self.date.length>10) {
        tem=[self.date substringToIndex:10];
    }else{
        
        tem=self.date;

    }
   
    
    return tem;
    
}


@end
