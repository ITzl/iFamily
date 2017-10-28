//
//  SignViewController.m
//  iFamily
//
//  Created by 刘申臣 on 2017/7/12.
//  Copyright © 2017年 Mr.Nut. All rights reserved.
//

#import "SignViewController.h"
#import "LogViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface SignViewController ()
@property(nonatomic,strong) UITextField *text1;
@property(nonatomic,strong) UITextField *text2;
@property(nonatomic,strong) UITextField *text3;

@end

@implementation SignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
    
    
    
    [super.navigationController setNavigationBarHidden:NO animated:TRUE];
    UIImageView *backView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back2"]];
    backView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:backView];
    
    
    //设置用户名栏
    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(40, 207, 80, 32)];
    
    label1.text = @"用户名：";
    [self.view addSubview:label1];
    //设置用户名输入栏
    UITextField *text1 = [[UITextField alloc]initWithFrame:CGRectMake(126, 207, 172, 30)];
    text1.borderStyle =  UITextBorderStyleLine;
    text1.placeholder = @"请输入用户名";
    [self.view addSubview:text1];
    _text1 = text1;
    
    
    //设置用户名栏
    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(40, 311, 80, 32)];
    
    label2.text = @"密码：";
    [self.view addSubview:label2];
    //设置密码输入栏
    UITextField *text2 = [[UITextField alloc]initWithFrame:CGRectMake(126, 311, 172, 30)];
    text2.borderStyle =  UITextBorderStyleLine;
    text2.placeholder = @"请输入密码";
    text2.secureTextEntry = YES;
    [self.view addSubview:text2];
    _text2 = text2;
    
    //设置用户名栏
    UILabel *label3 =[[UILabel alloc]initWithFrame:CGRectMake(40, 425, 90, 32)];
    
    label3.text = @"确认密码：";
    [self.view addSubview:label3];
    //设置确认密码输入栏
    UITextField *text3 = [[UITextField alloc]initWithFrame:CGRectMake(126, 425, 172, 30)];
    text3.borderStyle =  UITextBorderStyleLine;
    text3.placeholder = @"请再次输入密码";
    text3.secureTextEntry = YES;
    [self.view addSubview:text3];
    _text3 = text3;
    
    //设置确定注册按钮
    UIButton *button  = [[UIButton alloc]initWithFrame:CGRectMake(126, 525, 172, 30)];
    [button setTitle:@"确认注册" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:255/255.0 green:140/255.0 blue:0/255.0 alpha:1]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button.layer setCornerRadius:8.0];
    [button.layer setBorderWidth:1.0];
    [button addTarget:self action:@selector(sureSignin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}
-(void)fingerTapped:(UIGestureRecognizer *)gestureRecongnizer
{
    [self.view endEditing:YES];
}

//设置确认注册点击事件
-(void)sureSignin
{
    NSString *str1 = _text1.text;
    NSString *str2 = _text2.text;
    NSString *str3 = _text3.text;
    //新建AVUser实例 设置用户名和密码
    AVUser *user = [AVUser user];
    user.username = str1;
    user.password = str2;
    
    //判断输入栏是否空
    if(str1.length == 0 || str2.length == 0 || str3.length == 0)
    {
        //初始化提示框
        UIAlertController *alert1 = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或者密码不能为空！" preferredStyle:UIAlertControllerStyleAlert];
        [alert1 addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){}]];
        //弹出提示框
        [self presentViewController:alert1 animated:true completion:nil];
    }
    //判断密码是否小于6位
    else if (str2.length < 6)
    {
        //初始化提示框
        UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码长度不能小于6位！" preferredStyle:UIAlertControllerStyleAlert];
        [alert2 addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){}]];
        //弹出提示框
        [self presentViewController:alert2 animated:true completion:nil];
    }
    //判断两次密码是否输入相同
    else if (str2 != str3)
    {
        //初始化提示框
        UIAlertController *alert3 = [UIAlertController alertControllerWithTitle:@"提示" message:@"两次密码输入不一致！" preferredStyle:UIAlertControllerStyleAlert];
        [alert3 addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){}]];
        //弹出提示框
        [self presentViewController:alert3 animated:true completion:nil];
    }
    else
    {
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // 注册成功
                NSLog(@"注册成功");
                //初始化提示框
                UIAlertController *alertsuccess = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
                [alertsuccess addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action)
                                         {
                                             //提示框点击事件，跳转到登录页面
                                             LogViewController *vc = [[LogViewController alloc]init];
                                             [self presentViewController:vc animated:YES completion:nil];
                                         }]];
                //弹出提示框
                [self presentViewController:alertsuccess animated:true completion:nil];
            } else {
                // 失败的原因可能有多种，常见的是用户名已经存在。
                NSLog(@"注册失败");
                UIAlertController *alertfail = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名已存在！" preferredStyle:UIAlertControllerStyleAlert];
                [alertfail addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){}]];
                //弹出提示框
                [self presentViewController:alertfail animated:true completion:nil];
            }
        }];
    }
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
