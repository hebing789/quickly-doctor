//
//  SyndromeInfoModel.m
//  QuickCure
//
//  Created by ymQiao on 16/9/16.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "SyndromeInfoModel.h"
#import "NetWorkTool.h"

@implementation SyndromeInfoModel

+(instancetype)modelWithDict:(NSDictionary *)dict
{
    SyndromeInfoModel *model =[[SyndromeInfoModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}



+ (void)modelWithSuccess:(void (^)(NSArray<SyndromeInfoModel *> *))successBlock error:(void (^)())errorBlock
{
    NSDictionary *paramDic = @{@"page":@1,@"page_size":@15,@"ci2_id":@3};
    
    [[NetWorkTool shareManager]POST_RequestWithUrlString:@"http://iosapi.itcast.cn/complicationList.json.php" parmas:paramDic successBloock:^(NSDictionary *responseObject) {
        
        NSMutableArray *mArray = [NSMutableArray array];
    
        NSArray<NSDictionary *> *array = responseObject[@"data"];
        
        [array enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            for (int  i = 0; i < 3; i++) {
                SyndromeInfoModel *model = [SyndromeInfoModel modelWithDict:obj];
                [mArray addObject:model];
            }
        }];
        
        
        if(successBlock){
            successBlock(mArray.copy);
        }
        
        
    } failureBlock:^(NSError *error) {
        NSLog(@">>>>>error");
        
    }];
}

@end
