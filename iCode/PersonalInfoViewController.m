//
//  PersonalInfoViewController.m
//  iFamily
//
//  Created by SoolyChristina on 16/10/30.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "IconTableViewCell.h" 
#import "MeTableViewCell.h"
#import "ChangeView.h"

@interface PersonalInfoViewController () <UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>


@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

-(void)initUI{
    self.title = @"个人信息";
    [self.view addSubview:self.tableView];
}

-(void)initData{
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //禁止滑动
        _tableView.scrollEnabled = NO;
        //背景颜色
        _tableView.backgroundColor = iFamilyTableviewBgColor;
        
        UIView *v = [[UIView alloc] initWithFrame:CGRectZero];
        [_tableView setTableFooterView:v];
    }
    return _tableView;
}

#pragma mark - tableView方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 3;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0 && indexPath.row == 0) {
        IconTableViewCell *cell = [IconTableViewCell iconTableViewCellWithTableView:tableView];
        cell.Vc = self;
        return cell;
    }else{
        MeTableViewCell *cell = [MeTableViewCell tableViewCellWithTableView:tableView andIndexPath:indexPath];
        if (indexPath.section == 0 && indexPath.row == 1) {
            cell.textLabel.text = @"昵称";
            cell.detailTextLabel.text = self.dataDic[@"userNickName"];
        }else if (indexPath.section == 0 && indexPath.row == 2){
            cell.textLabel.text = @"账号";
            cell.detailTextLabel.text = self.dataDic[@"userAccount"];
        }else if (indexPath.section == 1 && indexPath.row == 0){
            cell.textLabel.text = @"姓名";
            cell.detailTextLabel.text = self.dataDic[@"userName"];
        }else if (indexPath.section == 1 && indexPath.row == 1){
            cell.textLabel.text = @"地区";
            cell.detailTextLabel.text = self.dataDic[@"userRegion"];
        }else if (indexPath.section == 1 && indexPath.row == 2){
            cell.textLabel.text = @"个人介绍";
            cell.detailTextLabel.text = self.dataDic[@"userMoto"];
        }
        return cell;
    }
}

//row的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section ==0 && indexPath.row == 0) {
        return iconRowHeight;
    }else{
        return nomalRowHeight;
    }
}

//section头部间距
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return iFamilyTableViewSectionMargin;
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = iFamilyTableviewBgColor;
    return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //当点击指定行的cell时创建 更改数据的view
    if (indexPath.section == 0 && indexPath.row == 1) {
        ChangeView *changeView = [[ChangeView alloc ]changeViewWithTittleName:@"更改昵称"
                                                              dataStr:self.dataDic[@"userNickName"]
                                                           userInfoVc:self];
        changeView.userInfoVC = self;
        [self lew_presentPopupView:changeView
                         animation:[LewPopupViewAnimationSpring new] dismissed:^{
                             }];
    }if (indexPath.section == 1 && indexPath.row == 0) {
        ChangeView *changeView = [[ChangeView alloc ]changeViewWithTittleName:@"更改姓名"
                                                                      dataStr:self.dataDic[@"userName"]
                                                                   userInfoVc:self];
        changeView.userInfoVC = self;
        [self lew_presentPopupView:changeView
                         animation:[LewPopupViewAnimationSpring new] dismissed:^{
                         }];
    }if (indexPath.section == 1 && indexPath.row == 2) {
        ChangeView *changeView = [[ChangeView alloc ]changeViewWithTittleName:@"更改个性签名"
                                                                      dataStr:self.dataDic[@"userMoto"]
                                                                   userInfoVc:self];
        changeView.userInfoVC = self;
        [self lew_presentPopupView:changeView
                         animation:[LewPopupViewAnimationSpring new] dismissed:^{
                         }];
    }
}

#pragma mark - imagePickerController方法

//选择完成
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"选择完成");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
