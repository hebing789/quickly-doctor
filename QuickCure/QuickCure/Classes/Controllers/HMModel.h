//
//  HMModel.h
//  QuickCure
//
//  Created by 李亚 on 9/13/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMModel : NSObject

@property (nonatomic,copy)NSString *doctor_portrait;

@property (nonatomic,copy)NSString *doctor_name;

@property (nonatomic,copy)NSString *doctor_title_name;

@property (nonatomic,copy)NSString *hospital_name;

@property (nonatomic,copy)NSString *operation_count;

@property (nonatomic,copy)NSString *flower;

@property (nonatomic,copy)NSString *doctor_attention_id;

@property (nonatomic,copy)NSString *easymob_id;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+(void)modelWithSuccess:(void(^)(NSArray<HMModel *> *))successBlock error:(void(^)())errorBlock;


@end
