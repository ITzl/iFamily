//
//  LineDisplayModel.h
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LineDisplayModel : NSObject
@property (nonatomic,assign) BOOL isFirst;
@property (nonatomic,copy) NSString *day;
@property (nonatomic,strong) NSMutableArray *imgArray;

@end
