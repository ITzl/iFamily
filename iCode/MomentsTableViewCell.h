//
//  MomentsTableViewCell.h
//  iFamily
//
//  Created by SoolyChristina on 2016/11/14.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Moments.h"

@class MomentsViewModel;
@interface MomentsTableViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray *Momentss;
@property (nonatomic, strong) MomentsViewModel *MomentsFrame;

+ (instancetype)MomentsCellWithTableView:(UITableView *)tableView;

@end
