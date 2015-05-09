//
//  SLMeSettingViewController.h
//  MyProjectFDD
//
//  Created by mac on 15-5-9.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 我-设置
 */
@interface SLMeSettingViewController : UIViewController

//修改手机号容器
@property (strong, nonatomic) IBOutlet UIView *changePhoneNum;

//手机号lable
@property (strong, nonatomic) IBOutlet UILabel *phoneNumLable;

//是否接收短信
- (IBAction)isReceiveMsg:(id)sender;

//是否接收提示音
- (IBAction)isReceiveVoice:(id)sender;

//新版本检测View
@property (strong, nonatomic) IBOutlet UIView *versionsCheckoutView;

//版本Lable
@property (strong, nonatomic) IBOutlet UILabel *versionsLable;

//欢迎页面
@property (strong, nonatomic) IBOutlet UIView *welcomeView;

//意见反馈
@property (strong, nonatomic) IBOutlet UIView *feedBlackView;

//退出登录
- (IBAction)exitLoginButtonClick:(id)sender;



@end
