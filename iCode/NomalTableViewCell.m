//
//  NomalTableViewCell.m
//  iFamily
//
//  Created by SoolyChristina on 2016/10/29.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import "NomalTableViewCell.h"

@interface NomalTableViewCell ()

/**
 *  头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

/**
 *  操作名
 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

@implementation NomalTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(NomalTableViewCell *)nomalTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *reuseID = @"reuseID";
    NomalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"NomalTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

-(void)setMeMenu:(MeMenu *)meMenu{
    _meMenu = meMenu;
    self.nameLabel.text = meMenu.name;
    self.iconView.image = [UIImage imageNamed:meMenu.iconName];
}

@end
