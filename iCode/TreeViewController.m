//
//  TreeViewController.m
//  iFamily
//
//  Created by 刘申臣 on 2017/6/5.
//  Copyright © 2017年 Mr.Nut. All rights reserved.
//

#import "TreeViewController.h"

@interface TreeViewController ()

@end

@implementation TreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"家庭树";
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIImage *img = [UIImage imageNamed:@"关系图-1"];
    imgView.image = img;
    [self.view addSubview:imgView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
