//
//  TimeOneTableViewCell.m
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import "TimeOneTableViewCell.h"
@interface TimeOneTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView1;

@property (weak, nonatomic) IBOutlet UIImageView *imgView2;
@property (weak, nonatomic) IBOutlet UIImageView *imgView3;

@end

@implementation TimeOneTableViewCell

+(UINib *)nib {
    return [UINib nibWithNibName:@"TimeOneTableViewCell" bundle:nil];
}

- (void)refreshUIWithImageArray:(NSArray *)array time:(NSString *)time
{
    self.timeLabel.text = time;
    
    if (array.count > 0) {
        self.imgView1.image = [UIImage imageNamed:array[0]];
    }
    
    if (array.count > 1) {
        self.imgView2.image = [UIImage imageNamed:array[1]];
    }
    
    if (array.count > 2) {
        self.imgView3.image = [UIImage imageNamed:array[2]];
    }
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
