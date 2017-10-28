//
//  PersonalInfoTableViewCell.m
//  iFamily
//
//  Created by SoolyChristina on 2016/10/29.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import "PersonalInfoTableViewCell.h"

@interface PersonalInfoTableViewCell ()

/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

/**
 *  用户昵称
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

/**
 *  详细信息
 */
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation PersonalInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

+(PersonalInfoTableViewCell *)PersonalInfoTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *reuseID = @"reuseID";
    PersonalInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"PersonalInfoTableViewCell" owner:nil options:nil]firstObject];
    }
    return cell;
}

-(void)setDataDic:(NSDictionary *)dataDic{
    _dataDic = dataDic;
    self.nameLabel.text = dataDic[@"userName"];
    self.detailLabel.text = [NSString stringWithFormat:@"iFamily号%@",dataDic[@"userAccount"]];
    self.imageView.image = [UIImage imageNamed:dataDic[@"userIcon"]];
}



@end
