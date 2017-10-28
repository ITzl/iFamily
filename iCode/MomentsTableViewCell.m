//
//  MomentsTableViewCell.m
//  iFamily
//
//  Created by SoolyChristina on 2016/11/14.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "MomentsTableViewCell.h"
#import "MomentsBodyView.h"
#import "MomentsToolBarView.h"
#import "MomentsViewModel.h"

@interface MomentsTableViewCell ()

//家庭圈主体
@property (nonatomic, weak) MomentsBodyView *bodyView;

//工具条
@property (nonatomic, weak) MomentsToolBarView *toolBarView;

@end

@implementation MomentsTableViewCell

+ (instancetype)MomentsCellWithTableView:(UITableView *)tableView{
    static NSString *reuseID = @"cell";
    MomentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[MomentsTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 阴影、圆角
        self.layer.backgroundColor = [UIColor grayColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0.5, 10);
        self.layer.shadowRadius = 7.0;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.3;
        self.layer.cornerRadius = 7.0;
        self.layer.masksToBounds = NO;
        // 添加子控件
        [self setChildView];
    }
    return self;
}

//添加子控件
- (void)setChildView{
    //Code圈主体
    MomentsBodyView *bodyView = [[MomentsBodyView alloc] init];
    [self addSubview:bodyView];
    self.bodyView = bodyView;
    
    //工具条
    MomentsToolBarView *toolBar = [[MomentsToolBarView alloc] init];
    [self addSubview:toolBar];
    self.toolBarView = toolBar;    
}

-(void)setMomentsFrame:(MomentsViewModel *)MomentsFrame{
    _MomentsFrame = MomentsFrame;
    
    //设置子控件的frame
    self.bodyView.frame = MomentsFrame.circleBodyFrame;
    self.bodyView.MomentsFrame = MomentsFrame;
    self.toolBarView.frame = MomentsFrame.circleToolBarFrame;
    self.toolBarView.MomentsFrame = MomentsFrame;
}

-(void)setFrame:(CGRect)frame{
    frame.origin.x += circleCellMargin;
    frame.size.width -= circleCellMargin * 2;
    [super setFrame:frame];
}

@end
