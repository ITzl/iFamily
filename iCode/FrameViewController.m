//
//  FrameViewController.m
//  iFamily
//
//  Created by SoolyChristina on 2016/10/31.
//  Copyright © 2016年 SoolyChrisitna. All rights reserved.
//

#import "FrameViewController.h"

@interface FrameViewController () <UIGestureRecognizerDelegate>

@end

@implementation FrameViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    //设置navigationBar不透明
    self.navigationBar.translucent = NO;
    

    //隐藏顶部线条
    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.interactivePopGestureRecognizer.delegate = self;
    //导航条颜色
    self.navigationBar.barTintColor = iFamilyNavigationBarColor;
    //tittle字体颜色
    NSMutableDictionary *titleTextAttribute = [NSMutableDictionary dictionary];
    titleTextAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = titleTextAttribute;
}

//状态栏样式
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 不是第一个push进来的 左上角加上返回键
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
        button.imageView.contentMode = UIViewContentModeScaleToFill;
        [button setFrame:CGRectMake(0, 0, 25, 25)];
        button.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        [button addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    }
    [super pushViewController:viewController animated:animated];
}
-(void)backClick
{
    [super popViewControllerAnimated:YES];
}

#pragma mark UIGestureRecognizerDelegate 代理方法

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{

    return self.childViewControllers.count > 1;
}

@end
