//
//  MeTableViewCell.m
//  iFamily
//
//  Created by SoolyChristina on 2016/10/31.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "MeTableViewCell.h"

@implementation MeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(MeTableViewCell *)tableViewCellWithTableView:(UITableView *)tableView andIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseID = @"MeTableViewCellID";
    MeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[MeTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID];
        cell.detailTextLabel.font = [UIFont systemFontOfSize:16];
    }
    return cell;
}

@end
