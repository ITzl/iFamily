//
//  LineDayModel.h
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LineDayModel : NSObject
@property (nonatomic,copy) NSString *day;
@property (nonatomic,strong) NSArray *imgArray;

@property (nonatomic,assign) int dayRows;
@property (nonatomic,strong) NSMutableArray *displayArray;

- (instancetype)initWithDay:(NSString *)day imgArray:(NSArray *)imgArray;

@end

