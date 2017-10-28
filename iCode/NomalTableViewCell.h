//
//  NomalTableViewCell.h
//  iFamily
//
//  Created by SoolyChristina on 2016/10/29.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MeMenu.h"

@interface NomalTableViewCell : UITableViewCell

@property (nonatomic,strong)MeMenu *meMenu;

+(NomalTableViewCell *)nomalTableViewCellWithTableView:(UITableView *)tableView;

@end
