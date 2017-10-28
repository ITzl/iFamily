//
//  AppDelegate.m
//  iFamily
//
//  Created by Mr.Nut on 16/10/29.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import "AppDelegate.h"
#import "FrameTabBarController.h"
#import "LogViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化SDK,连接AppID和AppKey
    [AVOSCloud setApplicationId:@"GSSCNvjHceVRjTsvskMBrre5-gzGzoHsz" clientKey:@"7c7DWVBdRX5YL5OIDxz8A0T7"];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    FrameTabBarController *tableBarController = [[FrameTabBarController alloc]init];
    
    //设置tabBar不透明
    tableBarController.tabBar.translucent = NO;
    
    LogViewController *logVC = [[LogViewController alloc]init];
    //初始化navigationController
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:logVC];
    nav.navigationBar.backgroundColor = [UIColor colorWithRed:255/255.0 green:140/255.0 blue:0 alpha:1];
    //设置背景颜色
    //初始化rootViewController
    self.window.rootViewController = nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
