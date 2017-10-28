//
//  TimeLineViewController.m
//  云相册
//
//  Created by 刘申臣 on 2016/11/9.
//  Copyright © 2016年 刘申臣. All rights reserved.
//

#import "TimeLineViewController.h"
#import "TimeHeader.h"
#import "TimeOneTableViewCell.h"
#import "TimeTwoTableViewCell.h"
#import "LineDayModel.h"
#import "LineDisplayModel.h"
#import "LineMonthModel.h"

#define kSCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define kSCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@interface TimeLineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;



@end

@implementation TimeLineViewController

static NSString * cellTimeOne = @"cellTimeOne";
static NSString * cellTimeTwo = @"cellTimeTwo";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"时间轴相册";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = iFamilyNavigationBarColor;
    [self initData];
    [self tableView];
    
}
- (void)initData{
    
    LineDayModel *lModel00 = [[LineDayModel alloc]initWithDay:@"9.1" imgArray:@[@"1",@"2"]];
    LineDayModel *lModel01 = [[LineDayModel alloc]initWithDay:@"9.12" imgArray:@[@"3",@"4",@"5",@"6",@"7",@"8"]];
    LineDayModel *lModel02 = [[LineDayModel alloc]initWithDay:@"9.30" imgArray:@[@"8",@"9",@"10"]];
    
    LineMonthModel *lmModel0 = [[LineMonthModel alloc]initWithMonth:@"2016年9月" days:@[lModel00,lModel01,lModel02]];
    
    
    LineDayModel *lModel10 = [[LineDayModel alloc]initWithDay:@"10.5" imgArray:@[@"11",@"12",@"13"]];
    LineDayModel *lModel11 = [[LineDayModel alloc]initWithDay:@"10.22" imgArray:@[@"14",@"15",@"1"]];
    
    
    LineMonthModel *lmModel1 = [[LineMonthModel alloc]initWithMonth:@"2016年10月" days:@[lModel10,lModel11]];
    
    
    LineDayModel *lModel20 = [[LineDayModel alloc]initWithDay:@"11.1" imgArray:@[@"2",@"3",@"1",@"3",@"1"]];
    LineDayModel *lModel21 = [[LineDayModel alloc]initWithDay:@"11.2" imgArray:@[@"3",@"2",@"1",@"3",@"1",@"3",@"1",@"3",@"1"]];
    
    LineMonthModel *lmModel2 = [[LineMonthModel alloc]initWithMonth:@"2016年11月" days:@[lModel20,lModel21]];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[lmModel0,lmModel1,lmModel2]];
    
    for (LineMonthModel *mModel in self.dataArray) {
        mModel.shouldOpen = YES;
    }
    
    NSLog(@"dataArray : %@",self.dataArray);
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    NSLog(@"sections : %d",self.dataArray.count);
    
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    LineMonthModel *mModel =self.dataArray[section];  //五月
    NSLog(@"monthRows : %d",mModel.monthRows);
    
    if (mModel.shouldOpen) {
        return mModel.monthRows;
    }
    
    return 0;
    
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    TimeHeader *header = [[TimeHeader alloc]init];
    
    LineMonthModel *mModel =self.dataArray[section];
    
    header.timeLabel.text = mModel.month;
    header.btn.tag = section;
    
    if (mModel.shouldOpen) {
        
        [header.btn setTitle:@"关闭" forState:UIControlStateNormal];
        
    }else{
        [header.btn setTitle:@"打开" forState:UIControlStateNormal];
        
    }
    
    [header.btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return header;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell;
    
    LineMonthModel *mModel =self.dataArray[indexPath.section];
    LineDisplayModel *dModel = mModel.displayArray[indexPath.row];
    
    NSLog(@"%@  isFirst : %d , imgArray : %@",dModel.day,dModel.isFirst,dModel.imgArray);
    
    if (dModel.isFirst) {
        TimeOneTableViewCell *tempCell = [tableView dequeueReusableCellWithIdentifier:cellTimeOne];
        [tempCell refreshUIWithImageArray:dModel.imgArray time:dModel.day];
        cell = tempCell;
        
    }else{
        TimeTwoTableViewCell *tempCell = [tableView dequeueReusableCellWithIdentifier:cellTimeTwo];
        [tempCell refreshUIWithImageArray:dModel.imgArray];
        cell = tempCell;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 86;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 20;
}

- (void)btnAction:(UIButton *)sender{
    
    LineMonthModel *lmModel = self.dataArray[sender.tag];
    lmModel.shouldOpen = !lmModel.shouldOpen;
    
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationFade];
    //    [self.tableView reloadData];  //使用这种方法关闭不自然
    
}

- (UITableView *)tableView{
    //    WS(weakSelf);
    if (!_tableView) {
        
        _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0,0, kSCREEN_WIDTH, kSCREEN_HEIGHT) style: UITableViewStyleGrouped];
        
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        [_tableView registerNib:[TimeOneTableViewCell nib] forCellReuseIdentifier:cellTimeOne];
        [_tableView registerNib:[TimeTwoTableViewCell nib] forCellReuseIdentifier:cellTimeTwo];
        
        [_tableView setSeparatorColor:[UIColor lightGrayColor]];
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.delegate = self;
        _tableView.dataSource= self;
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
