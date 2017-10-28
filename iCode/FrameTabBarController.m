//
//  FrameTabBarController.m
//  iFamily
//
//  Created by Mr.Nut on 16/10/29.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "FrameTabBarController.h"
#import "UIImage+image.h"
#import "FrameTabBar.h"
#import <objc/message.h>
#import "MeViewController.h"
#import "ChatViewController.h"
#import "FrameViewController.h"
#import "OptViewController.h"
#import "FamilyTreeViewController.h"
#import "TreeViewController.h"





@interface FrameTabBarController ()

@end

@implementation FrameTabBarController

+(void)initialize
{

    
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];//获取当前这个类下面的所有tabBarItem
    
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
    
    
    [item setTitleTextAttributes:att forState:UIControlStateSelected];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%s",__func__);
    
    //3.管理子控制器
    [self setUpAllChildViewController];
    //修改tabBar的位置
    
    //自定义tabBar
    FrameTabBar *tabBar = [[FrameTabBar alloc] initWithFrame:self.tabBar.frame];
    //由于tabBar是readonly所以用KVC赋值self.tabBar=tabBar;
    [self setValue:tabBar forKey:@"tabBar"];
    //objc_msgSend(self, @selector(setTabBar:),tabBar);
    NSLog(@"%@",self.tabBar);
    
    
}
#pragma mark-添加子控制器
-(void)setUpAllChildViewController{
     //聊天
    FrameViewController *chatVC = [[FrameViewController alloc]initWithRootViewController:[[ChatViewController alloc]init]];
    [self setUPOneChildViewController:chatVC image:[UIImage imageNamed:@"tabbar_chat"] selectedImage:[UIImage imageWithOringinalNanme:@"tabbar_chat_selected"] title:@"聊天"];
    
    
   //家庭分享
    FrameViewController *optVC = [[FrameViewController alloc]initWithRootViewController:[[OptViewController alloc]init]];
    [self setUPOneChildViewController:optVC image:[UIImage imageNamed:@"tabbar_share"] selectedImage:[UIImage imageWithOringinalNanme:@"tabbar_share_selected"] title:@"家庭分享"];
    //家庭树
//    FrameViewController *code = [[FrameViewController alloc]initWithRootViewController:[[FamilyTreeViewController alloc]init]];
//    [self setUPOneChildViewController:code image:[UIImage imageNamed:@"tabbar_tree"] selectedImage:[UIImage imageWithOringinalNanme:@"tabbar_tree_selected"] title:@"家庭树"];
    FrameViewController *treeVC = [[FrameViewController alloc]initWithRootViewController:[[TreeViewController alloc]init]];
    [self setUPOneChildViewController:treeVC image:[UIImage imageNamed:@"tabbar_tree"] selectedImage:[UIImage imageWithOringinalNanme:@"tabbar_tree_selected"] title:@"家庭树"];
    
    
    //Me
    FrameViewController *me = [[FrameViewController alloc]initWithRootViewController:[[MeViewController alloc]init]];
    [self setUPOneChildViewController:me image:[UIImage imageNamed:@"tabbar_me"] selectedImage:[UIImage imageWithOringinalNanme:@"tabbar_me_selected"] title:@"我"];
    
}
-(void)setUPOneChildViewController:(UIViewController*)vc image:(UIImage*)image selectedImage :(UIImage*)selectedImage title:(NSString*)title
{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
        NSMutableDictionary *att = [NSMutableDictionary dictionary];
        att[NSForegroundColorAttributeName] = iFamilyNavigationBarColor;
    
        [vc.tabBarItem setTitleTextAttributes:att forState:UIControlStateSelected];
//    vc.tabBarItem.badgeValue=@"1";
    UIImage *setImage = selectedImage;
    vc.tabBarItem.selectedImage = setImage;
    [self addChildViewController:vc];
}

@end
