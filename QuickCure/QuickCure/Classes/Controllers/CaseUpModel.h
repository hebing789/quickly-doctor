//
//  CaseUpModel.h
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaseUpModel : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *label;
@property(nonatomic,copy)NSString *img;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+ (NSArray *)upList;
@end
