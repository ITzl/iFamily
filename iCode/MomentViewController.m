//
//  MomentViewController.m
//  iFamily
//
//  Created by SoolyChristina on 16/10/29.
//  Copyright © 2016年 SoolyChristina. All rights reserved.
//

#import "MomentViewController.h"
#import "MomentsTableViewCell.h"
#import "MomentsViewModel.h"
#import "MJRefresh.h"

@interface MomentViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSMutableArray *Momentss;      //数据模型
@property (nonatomic ,strong) NSMutableArray *MomentsFrames; //ViewModel(包含cell子控件的Frame)

@end

@implementation MomentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setData];
}

- (void)setUI{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.title = @"家庭圈";
    //添加右边btn
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [rightBtn setImage:[UIImage imageNamed:@"navigationbar_push"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
}

- (void)setData{
    
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        CGFloat tableViewH =  self.view.bounds.size.height - 49;
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, tableViewH) style:UITableViewStylePlain];
        _tableView = tableView;
        //防止tableView被tabBar遮挡
        _tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, CGRectGetHeight(self.tabBarController.tabBar.frame), 0.0f);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.backgroundColor = iFamilyTableviewBgColor;
        
        //下拉刷新
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        [_tableView.mj_header beginRefreshing];
    }
    return _tableView;
}

- (NSMutableArray *)Momentss{
    if (!_Momentss) {
        _Momentss = [NSMutableArray array];
        _Momentss = [Moments Momentss];
    }
    return _Momentss;
}

- (NSMutableArray *)MomentsFrames{
    if (!_MomentsFrames) {
        _MomentsFrames = [NSMutableArray array];
        
        //数据模型 => ViewModel(包含cell子控件的Frame)
        for (Moments *Moments in self.Momentss) {
            MomentsViewModel *MomentsFrame = [[MomentsViewModel alloc] init];
            MomentsFrame.Moments = Moments;
            [_MomentsFrames addObject:MomentsFrame];
        }
    }
    return _MomentsFrames;
}

#pragma mark - 加载最新数据

- (void)loadNewData{
    //模拟增加数据
    for (Moments *Moments in self.Momentss) {
        MomentsViewModel *MomentsFrame = [[MomentsViewModel alloc] init];
        MomentsFrame.Moments = Moments;
        [_MomentsFrames addObject:MomentsFrame];
    }

    [self.tableView reloadData];
    [self.tableView.mj_header endRefreshing];

}

#pragma mark - tableView的方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"%@",self.Momentss);
    return self.Momentss.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MomentsTableViewCell *cell = [MomentsTableViewCell MomentsCellWithTableView:tableView];
    cell.MomentsFrame = self.MomentsFrames[indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //取数据
    MomentsViewModel *MomentsFrame = self.MomentsFrames[indexPath.section];
    return MomentsFrame.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return circleCellMargin;
}

//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = iFamilyTableviewBgColor;
    return footerView;
}


@end
