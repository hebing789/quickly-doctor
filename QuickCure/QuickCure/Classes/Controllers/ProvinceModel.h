//
//  ProvinceModel.h
//  QuickCure
//
//  Created by hebing on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProvinceModel : NSObject

@property(nonatomic,strong)NSArray* cities;

@property(nonatomic,copy) NSString*name;


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
+(instancetype) provinceWithDict:(NSDictionary *)dict;


/**
 *  根据plist文件返回一个模型数组
 *
 *  @param fileName 传入plist文件的名字
 *
 *  @return 模型数组
 */
+ (NSArray *)provinceWithPlistFileName:(NSString *)fileName;


//- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
