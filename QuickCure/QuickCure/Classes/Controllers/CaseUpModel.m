//
//  CaseUpModel.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseUpModel.h"

@implementation CaseUpModel

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    CaseUpModel *model = [[CaseUpModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

+ (NSArray *)upList
{
    NSMutableArray *nmarr = [NSMutableArray array];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CaseUpCell.plist" ofType:nil]];
                    
    for (NSDictionary *dict in arr) {
        CaseUpModel *model = [CaseUpModel modelWithDict:dict];
        [nmarr addObject:model];
    }
    return nmarr.copy;
}
@end
