//
//  MeMenu.h
//  iFamily
//
//  Created by SoolyChristina on 16/10/29.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeMenu : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *iconName;

-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)initWithDIc:(NSDictionary *)dic;

+(NSMutableArray *)menuArrs;

@end
