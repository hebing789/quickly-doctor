//
//  xinXue.m
//  QuickCure
//
//  Created by 李亚 on 9/16/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import "xinXue.h"
#import "NetWorkTool.h"


@implementation xinXue

+(instancetype)modelWithDict:(NSDictionary *)dict
{
    xinXue *model =[[xinXue alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}



+ (void)modelWithSuccess:(void (^)(NSArray<xinXue *> *))successBlock error:(void (^)())errorBlock
{
    NSDictionary *parmas = @{@"page":@1,@"page_size":@15,@"ci1_id":@1,@"keyword":@""};
    
    [[NetWorkTool shareManager]POST_RequestWithUrlString:@"http://iosapi.itcast.cn/searchCI3List.json.php" parmas:parmas successBloock:^(NSDictionary *responseObject) {
        
//                NSLog(@"%@",responseObject);
        NSMutableArray *mArray = [NSMutableArray array];
        //        NSString *rootKey =  responseObject.keyEnumerator.nextObject;
        //        NSArray<NSDictionary *> *array = responseObject[rootKey];
        NSArray<NSDictionary *> *array = responseObject[@"data"];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            xinXue *model = [xinXue modelWithDict:obj];
            [mArray addObject:model];
        }];
        
        
        if(successBlock){
            successBlock(mArray.copy);
        }
        
        
    } failureBlock:^(NSError *error) {
        
    }];
}

@end
