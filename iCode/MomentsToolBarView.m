//
//  MomentsToolBarView.m
//  iFamily
//
//  Created by SoolyChristina on 2016/11/14.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "MomentsToolBarView.h"
#import "MomentsViewModel.h"
#import "Moments.h"

@interface MomentsToolBarView ()

@property (nonatomic ,weak) UIButton *likeBtn;
@property (nonatomic ,weak) UIButton *commentBtn;

@end

@implementation MomentsToolBarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加子控件
        [self setChildView];
    }
    return self;
}

- (void)setChildView{
    self.backgroundColor = [UIColor colorWithHexString:@"#555555"];
    //点赞
    UIButton *likeBtn = [[UIButton alloc] init];
    [likeBtn setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    [likeBtn setTitleColor:circleCellToolBarTintColor forState:UIControlStateNormal];
    likeBtn.titleLabel.font = circleCellToolBarTittleFont;
    [self addSubview:likeBtn];
    self.likeBtn = likeBtn;
    
    //评论
    UIButton *commentBtn = [[UIButton alloc] init];
    [commentBtn setImage:[UIImage imageNamed:@"comment"] forState:UIControlStateNormal];
    [commentBtn setTitleColor:circleCellToolBarTintColor forState:UIControlStateNormal];
    commentBtn.titleLabel.font = circleCellToolBarTittleFont;
    [self addSubview:commentBtn];
    self.commentBtn = commentBtn;
}

-(void)setMomentsFrame:(MomentsViewModel *)MomentsFrame{
    _MomentsFrame = MomentsFrame;
    self.likeBtn.frame = MomentsFrame.ToolLikeFrame;
    [self.likeBtn setTitle:[NSString stringWithFormat:@" %@",MomentsFrame.Moments.like_count] forState:UIControlStateNormal];
    
    self.commentBtn.frame = MomentsFrame.ToolCommentFrame;
    [self.commentBtn setTitle:[NSString stringWithFormat:@" %@",MomentsFrame.Moments.comment_count] forState:UIControlStateNormal];
}

@end
