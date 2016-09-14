//
//  HMModel.m
//  QuickCure
//
//  Created by 李亚 on 9/13/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import "HMModel.h"
#import "NetWorkTool.h"
@implementation HMModel

+(instancetype)modelWithDict:(NSDictionary *)dict
{
    HMModel *model =[[HMModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}



+ (void)modelWithSuccess:(void (^)(NSArray<HMModel *> *))successBlock error:(void (^)())errorBlock
{
     NSDictionary *parmas = @{@"user_id":@1000089,@"page_size":@15,@"page":@1};
    
    [[NetWorkTool shareManager]POST_RequestWithUrlString:@"http://iosapi.itcast.cn/doctorList.json.php" parmas:parmas successBloock:^(NSDictionary *responseObject) {
        
//        NSLog(@"%@",responseObject);
        NSMutableArray *mArray = [NSMutableArray array];
//        NSString *rootKey =  responseObject.keyEnumerator.nextObject;
//        NSArray<NSDictionary *> *array = responseObject[rootKey];
        NSArray<NSDictionary *> *array = responseObject[@"data"];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMModel *model = [HMModel modelWithDict:obj];
            [mArray addObject:model];
        }];
        
        
        if(successBlock){
            successBlock(mArray.copy);
        }

        
    } failureBlock:^(NSError *error) {
        
    }];
}
@end
