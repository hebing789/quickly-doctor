//
//  DoctorApplyModel.h
//  QuickCure
//
//  Created by ymQiao on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoctorApplyModel : NSObject
/**
 *  病人姓名
 */
@property(nonatomic,copy) NSString *patientName;
/**
 *  病情种类
 */
@property(nonatomic,copy) NSString *symptom;
/**
 *  就诊时间
 */
@property(nonatomic,copy) NSString *time;
/**
 *  医生姓名
 */
@property(nonatomic,copy) NSString *doctorName;
/**
 *  医生职称
 */
@property(nonatomic,copy) NSString *role;
/**
 *  就诊医院
 */
@property(nonatomic,copy) NSString *hospital;
/**
 *  就诊状态
 */
@property(nonatomic,copy) NSString *state;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)doctorApplyWithDict:(NSDictionary *)dict;
+ (NSArray *)doctorApplyModel;

@end
