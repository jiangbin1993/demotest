//
//  JJRequestModel.m
//  JJ
//
//  Created by meimi on 2018/8/15.
//  Copyright © 2018年 meimicompany. All rights reserved.
//

#import "JJRequestModel.h"

@implementation JJRequestModel

- (instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err {
    // 防止dict里面data为空字典的时候崩溃问题
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dict];
    if ([dict[@"data"] isEqual:@{}]) {
        [dic removeObjectForKey:@"data"];
    }
    return [super initWithDictionary:dic error:err];
}

/*
 如果出现model的字段跟保留字段重合就可以用这个方法修改
 */
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"l_errno" : @"errno"}];
}

@end
