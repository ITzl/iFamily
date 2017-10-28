//
//  Moments.m
//  iFamily
//
//  Created by SoolyChristina on 2016/11/14.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//  Code圈 数据模型

#import "Moments.h"

@implementation Moments

-(instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        //KVC赋值
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+(instancetype)initWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+(NSMutableArray *)Momentss{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Moments.plist" ofType:nil];
    NSArray *dicArr = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"%@",dicArr);
    NSMutableArray *arr = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArr) {
        Moments *Moments = [self initWithDic:dic];
        [arr addObject:Moments];
    }
    return arr;
}

@end
