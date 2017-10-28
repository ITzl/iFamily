//
//  ChangeView.h
//  iFamily
//
//  Created by SoolyChristina on 2016/11/3.
//  Copyright © 2016年 Mr.Nut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LewPopupViewController.h"
#import "PersonalInfoViewController.h"

@interface ChangeView : UIView

@property (nonatomic, copy) NSString *dataStr;
@property (nonatomic, weak) PersonalInfoViewController *userInfoVC;
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;

- (ChangeView *)changeViewWithTittleName:(NSString *)name
                                 dataStr:(NSString *)str
                              userInfoVc:(PersonalInfoViewController *)Vc;

@end
