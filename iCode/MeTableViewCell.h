//
//  MeTableViewCell.h
//  iFamily
//
//  Created by SoolyChristina on 2016/10/31.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeTableViewCell : UITableViewCell

@property (nonatomic,strong) NSDictionary *dataDic;

+(MeTableViewCell *)tableViewCellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath;

@end
