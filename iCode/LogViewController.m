//
//  LogViewController.m
//  iFamily
//
//  Created by 刘申臣 on 2017/7/12.
//  Copyright © 2017年 Mr.Nut. All rights reserved.
//

#import "LogViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "SignViewController.h"
#import "FrameViewController.h"
#import "FrameTabBarController.h"

@interface LogViewController ()
@property(nonatomic,strong)UITextField *text1;
@property(nonatomic,strong)UITextField *text2;


@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [super.navigationController setToolbarHidden:YES];
    
    
    UIImageView *backView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back"]];
    backView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:backView];
    
    
    
    //设置用户名栏
    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(86, 206, 79, 32)];
    
    label1.text = @"用户：";
    [self.view addSubview:label1];
    //用户名输入文本框
    UITextField *text1 = [[UITextField alloc]initWithFrame:CGRectMake(183, 207, 172, 30)];
    text1.borderStyle =  UITextBorderStyleLine;
    text1.placeholder = @"请输入用户名";
    //把文本内容赋给全局变量
    _text1 = text1;
    [self.view addSubview:text1];
    
    //设置密码栏
    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(86, 246, 79, 32)];
    
    label2.text = @"密码：";
    [self.view addSubview:label2];
    //密码输入文本框
    UITextField *text2 = [[UITextField alloc]initWithFrame:CGRectMake(183, 250, 172, 30)];
    text2.borderStyle =  UITextBorderStyleLine;
    text2.placeholder = @"请输入密码";
    text2.secureTextEntry = YES;
    //把文本内容赋给全局变量
    _text2 = text2;
    [self.view addSubview:text2];
    
    //设置登录按钮
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(86, 367, 98, 32)];
    [button1 setTitle:@"登录" forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:140/255.0 blue:0/255.0 alpha:1]];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [button1.layer setCornerRadius:8.0];
    [button1.layer setBorderWidth:1.0];
    [self.view addSubview:button1];
    
    //设置注册按钮
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(257, 367, 98, 32)];
    [button2 setTitle:@"注册" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor colorWithRed:255/255.0 green:140/255.0 blue:0/255.0 alpha:1]];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button2 addTarget:self action:@selector(signin) forControlEvents:UIControlEventTouchUpInside];
    [button2.layer setCornerRadius:8.0];
    [button2.layer setBorderWidth:1.0];
    [self.view addSubview:button2];
    
    
}

//设置“登录”按钮点击事件
-(void)login
{
    AVUser *user = [AVUser user];
    //从文本框的值获取当前输入的用户名及密码
    user.username = _text1.text;
    user.password = _text2.text;
    
    //用户登录
    [AVUser logInWithUsernameInBackground:user.username password:user.password block:^(AVUser *user, NSError *error) {
        if (user != nil) {
            NSLog(@"user存在");
            FrameTabBarController *tableBarController = [[FrameTabBarController alloc]init];
            
            //设置tabBar不透明
            tableBarController.tabBar.translucent = NO;
            [self presentViewController:tableBarController animated:YES completion:nil];
            //loginViewController *loginvc = [[loginViewController alloc]init];
            //[self presentViewController:loginvc animated:YES completion:nil];
        } else {
            NSLog(@"user不存在");
            UIAlertController *shibai = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户不存在或密码错误" preferredStyle:UIAlertControllerStyleAlert];
            [shibai addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){}]];
            [self presentViewController:shibai animated:true completion:nil];
            NSLog(@"当前登录账户：%@",user.username);
            
        }
    }];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
    
    
}
-(void)fingerTapped:(UIGestureRecognizer *)gestureRecongnizer
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置“注册”按钮事件
-(void)signin
{
    //注册成功跳转到下一个页面
    SignViewController *signinvc = [[SignViewController alloc]init];
    signinvc.navigationItem.title = @"注册";
    [self.navigationController pushViewController:signinvc animated:YES];
}

@end

