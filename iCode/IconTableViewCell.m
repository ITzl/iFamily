//
//  IconTableViewCell.m
//  iFamily
//
//  Created by SoolyChristina on 16/10/30.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "IconTableViewCell.h"

@interface IconTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@end

@implementation IconTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(IconTableViewCell *)iconTableViewCellWithTableView:(UITableView *)tableView{
    static NSString *reuseID = @"reuseID";
    IconTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"IconTableViewCell" owner:nil options:nil]firstObject];
    }
    return cell;
}

//点击头像
- (IBAction)iconClick:(UIButton *)sender {
    //创建提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更换头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"从相册里选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //创建UIImagePickerController
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        //通过全部相册
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //允许编辑
        imagePicker.allowsEditing = YES;
        imagePicker.delegate = self.Vc;
        [self.Vc presentViewController:imagePicker animated:YES completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [self.Vc presentViewController:alert animated:YES completion:nil];
}

@end
