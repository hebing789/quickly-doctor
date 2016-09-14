//
//  WeatherModel.h
//  QuickCure
//
//  Created by hebing on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property(nonatomic,copy) NSString*nightPictureUrl;
@property(nonatomic,copy) NSString*weather;
@property(nonatomic,copy) NSString*wind;
@property(nonatomic,copy) NSString*temperature;
@property(nonatomic,copy) NSString*dayPictureUrl;
@property(nonatomic,copy) NSString*date;
@property(nonatomic,copy) NSString*temDate;
//@property(nonatomic,copy) NSString*location;

/**
 *  对象初始化方法,对象方法
 *
 *  @param dict 传入字典数据
 *
 *  @return 返回当前类的对象
 */
- (instancetype)initWithDict:(NSDictionary *)dict;

/**
 *  对象初始化方法,类方法
 *
 *  @param dict 传入字典数据
 *
 *  @return 返回当前类
 */
+(instancetype) modelWithDict:(NSDictionary *)dict;


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
//由于定的是对象方法,访问不了属性,所以在这里面增肌urlstring,再访问属性没用,只能改方法,在方法里增加参数
+(void)modelWithSucess:(void(^)(NSArray* ary))sucessBlock andError:(void(^)())errorBlock andWithLocation:(NSString*)location;

@end
