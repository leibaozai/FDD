//
//  SLFindHousePriceViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLFindHousePriceViewController.h"
#import "SLVillageViewController.h"
#import "SLTypeTableViewController.h"
#import "SLOrientationTableViewController.h"



@interface SLFindHousePriceViewController ()
{
    IBOutlet UILabel *villageLable;
    IBOutlet UITextField *areaTextField;
    IBOutlet UILabel *typeLable;
    IBOutlet UILabel *orientationLable;
    IBOutlet UITextField *floorTextField;
    
    IBOutlet UIView *villageView;
    IBOutlet UIView *typeView;
    IBOutlet UIView *orientationView;
    
    NSString *roomStr;
    NSString *hallStr;
    NSString *guardStr;
}
@end

@implementation SLFindHousePriceViewController

//移除通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Orientation" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Room" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Hall" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Guard" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //打开交互
    [self openUesrInteraction];
    
    //处理通知中心
    [self processNotificationCenterMessage];
}

//处理通知中心
-(void)processNotificationCenterMessage
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationCenterMessage:) name:@"Orientation" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(room:) name:@"Room" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hall:) name:@"Hall" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(guard:) name:@"Guard" object:nil];
}

#pragma mark - Helper Methods

//处理消息
-(void)notificationCenterMessage:(NSNotification *)notification
{
    orientationLable.text = notification.object;
}

-(void)room:(NSNotification *)notification
{
    roomStr = notification.object;
    typeLable.text = roomStr;
}

-(void)hall:(NSNotification *)notification
{
    hallStr = notification.object;
    typeLable.text = [NSString stringWithFormat:@"%@%@",roomStr,hallStr];
}

-(void)guard:(NSNotification *)notification
{
    guardStr = notification.object;
    typeLable.text = [NSString stringWithFormat:@"%@%@%@",roomStr,hallStr,guardStr];
}

#pragma mark - Event Handlers

//打开交互
 -(void)openUesrInteraction
{
    villageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *villageGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(villageViewTouched)];
    [villageView addGestureRecognizer:villageGesture];
    
    typeView.userInteractionEnabled = YES;
    UITapGestureRecognizer *typeGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(typeViewTouched)];
    [typeView addGestureRecognizer:typeGesture];
    
    orientationView.userInteractionEnabled = YES;
    UITapGestureRecognizer *orientationGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(orientationViewTouched)];
    [orientationView addGestureRecognizer:orientationGesture];
}

//小区
-(void)villageViewTouched
{
    SLVillageViewController *villageVC = [[SLVillageViewController alloc] init];
    
/**
 更改present为push
 */
    [self.navigationController pushViewController:villageVC animated:YES];
//    [self presentViewController:villageVC animated:YES completion:^{
//        
//    }];
}

//户型
-(void)typeViewTouched
{
    SLTypeTableViewController *typeVC = [[SLTypeTableViewController alloc] init];
    [self.navigationController pushViewController:typeVC animated:YES];
}

//朝向
-(void)orientationViewTouched
{
    SLOrientationTableViewController *orientationVC = [[SLOrientationTableViewController alloc] init];
    [self.navigationController pushViewController:orientationVC animated:YES];
}
@end
