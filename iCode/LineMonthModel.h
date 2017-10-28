//
//  LineMonthModel.h
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LineMonthModel : NSObject
@property (nonatomic,copy) NSString *month;
@property (nonatomic,strong) NSMutableArray *days;
@property (nonatomic,assign) int monthRows;
@property (nonatomic,assign) BOOL shouldOpen;
@property (nonatomic,strong) NSMutableArray *displayArray;

- (instancetype)initWithMonth:(NSString *)month days:(NSArray *)days;


@end
