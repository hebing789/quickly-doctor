//
//  SyndromeInfoModel.h
//  QuickCure
//
//  Created by ymQiao on 16/9/16.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SyndromeInfoModel : NSObject

@property(nonatomic,copy) NSString *complication_name;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+(void)modelWithSuccess:(void(^)(NSArray<SyndromeInfoModel *> *))successBlock error:(void(^)())errorBlock;

@end
