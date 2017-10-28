//
//  ChangeView.m
//  iFamily
//
//  Created by SoolyChristina on 2016/11/3.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "ChangeView.h"

@interface ChangeView ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

NSInteger type;

@implementation ChangeView

-(instancetype)initWithXib{
    self = [[[NSBundle mainBundle]loadNibNamed:@"ChangeView" owner:nil options:nil]lastObject];
    self.frame = CGRectMake(0, 0, 280, 140);
    return self;
}

- (ChangeView *)changeViewWithTittleName:(NSString *)name
                                 dataStr:(NSString *)str
                              userInfoVc:(PersonalInfoViewController *)Vc{
    ChangeView *changeView = [[ChangeView alloc]initWithXib];
    changeView.tittleLabel.text = name;
    changeView.dataStr = str;
    if ([name hasSuffix:@"姓名"]) {
        type = 0;
    }else if ([name hasSuffix:@"昵称"]){
        type = 1;
    }else{
        type = 2;
    }

    changeView.layer.cornerRadius = 8.0;
    changeView.layer.backgroundColor = [UIColor whiteColor].CGColor;
//    changeView.layer.masksToBounds = YES;
    
    //阴影
    CALayer *subLayer = [CALayer layer];
    subLayer.backgroundColor = [UIColor grayColor].CGColor;
    subLayer.shadowOffset = CGSizeMake(0, 3);
    subLayer.shadowRadius = 5.0;
    subLayer.shadowColor = [UIColor blackColor].CGColor;
    subLayer.shadowOpacity = 0.8;
    subLayer.frame = changeView.layer.frame;
    subLayer.cornerRadius = 8.0;
//    subLayer.masksToBounds = NO;
    [changeView.layer insertSublayer:subLayer atIndex:0];

    
    //缓存视图渲染内容
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    return changeView;
}



-(void)setDataStr:(NSString *)dataStr{
    _dataStr = dataStr;
    self.textField.text = dataStr;
}

- (IBAction)okClick:(id)sender {
    if (type == 0) {
        [self.userInfoVC.dataDic setObject:self.textField.text forKey:@"userName"];
        [self.userInfoVC.tableView reloadData];
    }else if (type == 1){
        [self.userInfoVC.dataDic setObject:self.textField.text forKey:@"userNickName"];
        [self.userInfoVC.tableView reloadData];
    }else{
        [self.userInfoVC.dataDic setObject:self.textField.text forKey:@"userMoto"];
        [self.userInfoVC.tableView reloadData];
    }
    [self.userInfoVC lew_dismissPopupView];
}
- (IBAction)cancelClick:(id)sender {
    
    [self.userInfoVC lew_dismissPopupView];
}

@end
