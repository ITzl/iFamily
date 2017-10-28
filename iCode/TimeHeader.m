//
//  TimeHeader.m
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import "TimeHeader.h"

@implementation TimeHeader

-(instancetype)init
{
    self = [super init];
    self = [[NSBundle mainBundle] loadNibNamed:@"TimeHeader" owner:nil options:nil][0];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}



@end
