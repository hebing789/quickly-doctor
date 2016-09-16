//
//  xinXue.h
//  QuickCure
//
//  Created by 李亚 on 9/16/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface xinXue : NSObject

@property (nonatomic,copy)NSString *ci3_id;

@property (nonatomic,copy)NSString *ci3_name;

@property (nonatomic,copy)NSString *ci2_id;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+(void)modelWithSuccess:(void(^)(NSArray<xinXue *> *))successBlock error:(void(^)())errorBlock;
@end
