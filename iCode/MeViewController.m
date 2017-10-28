//
//  MeViewController.m
//  iFamily
//
//  Created by 刘申臣 on 16/10/29.
//  Copyright © 2016年 刘申臣 All rights reserved.
//

#import "MeViewController.h"
#import "PersonalInfoTableViewCell.h"
#import "NomalTableViewCell.h"
#import "MeMenu.h"
#import "PersonalInfoViewController.h"

@interface MeViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArrs; //数据

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

-(void)initUI{
    self.title = @"我";
    [self.view addSubview:self.tableView];
}

-(void)initData{
    
}

-(NSMutableArray *)dataArrs{
    if (_dataArrs == nil) {
        _dataArrs = [NSMutableArray array];
        self.dataArrs = [MeMenu menuArrs];
    }
    return _dataArrs;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        //取消cell的分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //禁止滑动
        _tableView.scrollEnabled = NO;
        //背景颜色
        _tableView.backgroundColor = iFamilyTableviewBgColor;

    }
    return _tableView;
}
//模拟数据
-(NSDictionary *)dataDic{
    if (!_dataDic) {
        _dataDic = [NSMutableDictionary dictionary];
        _dataDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"123456",@"userAccount",@"小张",@"userNickName",@"张三",@"userName",@"家",@"userIcon",@"湖北 武汉",@"userRegion",@"男",@"userSex",@"我是张三",@"userMoto", nil];
        NSLog(@"%@",_dataDic);
    }
    return _dataDic;
}

#pragma mark - tableView方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else{
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //创建用户信息cell
        return [PersonalInfoTableViewCell PersonalInfoTableViewCellWithTableView:tableView];
    }else{
        NomalTableViewCell *cell = [NomalTableViewCell nomalTableViewCellWithTableView:tableView];
        //获取数据
        if (indexPath.section == 1) {
            cell.meMenu = [self.dataArrs objectAtIndex:indexPath.row];
        }else if (indexPath.section == 2){
            cell.meMenu = [self.dataArrs objectAtIndex:indexPath.row + 2];
        }
        return cell;
    }
}

//row的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
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

//section底部间距

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section ==0 && indexPath.row == 0) {
        PersonalInfoViewController *userInfoVc = [[PersonalInfoViewController alloc]init];
        userInfoVc.dataDic = self.dataDic;
        [self.navigationController pushViewController:userInfoVc animated:YES];
    }
}

@end
