//
//  PersonalInfoTableViewCell.h
//  iFamily
//
//  Created by SoolyChristina on 2016/10/29.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalInfoTableViewCell : UITableViewCell

@property (nonatomic,strong) NSDictionary *dataDic;

+(PersonalInfoTableViewCell *)PersonalInfoTableViewCellWithTableView:(UITableView *)tableView;

@end
