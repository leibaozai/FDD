//
//  SLAppSupport.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLAppSupport.h"
#import "SLSellHouseViewController.h"
#import "SLBuyHouseViewController.h"
#import "SLMeViewController.h"
#import "SLSettingViewController.h"

#import "SLNavigationController.h"
#import "SLTabBarViewController.h"


@implementation SLAppSupport

/**
 单例，只能实例化一次
 */
+(instancetype)instance
{
    static SLAppSupport *_appSupport;
    static dispatch_once_t tocken;
    dispatch_once(&tocken, ^{
        _appSupport = [[SLAppSupport alloc] init];
    });
    
    return _appSupport;
}

-(instancetype)init
{
    if (self = [super init]) {
        
        // 拿到AppDelegate中的Window
        _appWindow = [[[UIApplication sharedApplication] delegate] window];
    }
    return self;
}

-(void)load
{
    [self createTabbarController];
}

/**
 初始化TabbarContrller
 */
-(void)createTabbarController
{
    // 初始化四个界面控制器
    SLBuyHouseViewController *buyHouseVC = [[SLBuyHouseViewController alloc] initWithNibName:@"SLBuyHouseViewController" bundle:nil];
    SLSellHouseViewController *sellHouseVC = [[SLSellHouseViewController alloc] initWithNibName:@"SLSellHouseViewController" bundle:nil];
    SLMeViewController *meVC = [[SLMeViewController alloc] initWithNibName:@"SLMeViewController" bundle:nil];
    SLSettingViewController *settingVC = [[SLSettingViewController alloc] initWithNibName:@"SLSettingViewController" bundle:nil];
    
    NSArray *vcs = @[buyHouseVC,sellHouseVC,meVC,settingVC];
    
    //图片
    NSArray *imageNames = @[@"daohang_buy01",@"daohang_sell01",@"daohang_wo01",@"daohang_gengduo01"];
    
    //选中图片
    NSArray *selectedImageNames = @[@"daohang_buy02",@"daohang_sell02",@"daohang_wo02",@"daohang_gengduo02"];
    
    //标题
    NSArray *tabbarItemTitles = @[@"买房",@"卖房",@"我",@"更多"];
    
    NSMutableArray *navs = [NSMutableArray arrayWithCapacity:vcs.count];
    
    for (NSInteger i=0; i<vcs.count; i++) {
        //依次取出分页控制器
        UIViewController *vc = vcs[i];
        
        // 添加NavigationController
        SLNavigationController *nav = [[SLNavigationController alloc] initWithRootViewController:vc];
        
        // 设置图片
        nav.tabBarItem.image = [UIImage imageNamed:imageNames[i]];
        nav.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageNames[i]];
        nav.tabBarItem.title = tabbarItemTitles[i];
        
        //
        nav.view.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight;
        
        [navs addObject:nav];
    }
    
    // 实例化TabbarController,并设置为Window的RootViewController
    SLTabBarViewController *tabbarVC = [[SLTabBarViewController alloc] init];
    tabbarVC.viewControllers = navs;
    
    _appWindow.rootViewController = tabbarVC;
    
}


@end
