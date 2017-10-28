//
//  OptViewController.m
//  iFamily
//
//  Created by 刘申臣 on 2016/11/17.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "OptViewController.h"
#import "PhotosStreamViewController.h"
#import "MomentViewController.h"


@interface OptViewController ()

@end

@implementation OptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"家庭分享";
}
- (IBAction)pushPotosStream:(id)sender {
    PhotosStreamViewController *photoVC = [[PhotosStreamViewController alloc]init];
    [self.navigationController pushViewController:photoVC animated:true];
    
}
- (IBAction)pushMoments:(id)sender {
    MomentViewController *momentVC = [[MomentViewController alloc]init];
    [self.navigationController pushViewController:momentVC animated:true];
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
