//
//  LineMonthModel.m
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import "LineMonthModel.h"
#import "LineDisplayModel.h"
#import "LineDayModel.h"


@implementation LineMonthModel

- (instancetype)initWithMonth:(NSString *)month days:(NSArray *)days
{
    self = [super init];
    self.month = month;
    self.days = [NSMutableArray arrayWithArray:days];
    self.monthRows = 0;
    
    self.displayArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i< self.days.count; i++) {
        
        LineDayModel *dModel = self.days[i];
        self.monthRows = self.monthRows + dModel.dayRows;
        [self.displayArray addObjectsFromArray:dModel.displayArray];
        
    }
    
    NSLog(@"该月行数 : %d , %@",self.monthRows,self.displayArray);
    
    
    return self;
}


-(NSMutableArray *)displayArray
{
    if (!_displayArray) {
        _displayArray = [[NSMutableArray alloc]init];
    }
    return _displayArray;
}

@end
