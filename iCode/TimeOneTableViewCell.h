//
//  TimeOneTableViewCell.h
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeOneTableViewCell : UITableViewCell
+(UINib *)nib;
- (void)refreshUIWithImageArray:(NSArray *)array time:(NSString *)time;
@end
