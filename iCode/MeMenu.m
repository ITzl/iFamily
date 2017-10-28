//
//  MeMenu.m
//  iFamily
//
//  Created by SoolyChristina on 16/10/29.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import "MeMenu.h"

@implementation MeMenu

-(instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        self.iconName = dic[@"icon"];
        self.name = dic[@"name"];
    }
    return self;
}

+(instancetype)initWithDIc:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

+(NSMutableArray *)menuArrs{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"dataArr" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrs = [NSMutableArray array];
    for (NSDictionary *dic in arr) {
        [arrs addObject:[MeMenu initWithDIc:dic]];
    }
    return arrs;
}

@end
