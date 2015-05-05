//
//  SLBuyHouseViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLBuyHouseViewController.h"
#import "SLUIFactory.h"

#import "SLCityListTableViewController.h"

@interface SLBuyHouseViewController ()
{
    //列表，地图
    UIBarButtonItem *titleBBI;
    
}
@property (strong, nonatomic) IBOutlet UILabel *describeLable;
//@property (strong, nonatomic) IBOutlet UIButton *btn;
@end

@implementation SLBuyHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    //中间的titleView
    [self initTitlView];
    
    //左，右navBar
    [self initLeftAndRightNavgationBar];
    
    
}

#pragma mark - Helper Methods

//中间的titleView
-(void)initTitlView
{
    //创建uiview充当容器
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 49)];
    //titleView.backgroundColor = [UIColor lightGrayColor];
    
    //创建lable
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 49)];
    titleLabel.text = @"深圳";
    titleLabel.textAlignment = NSTextAlignmentRight;
    [titleView addSubview:titleLabel];
    
    //创建图片
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 18, 15, 15)];
    imageV.image = [UIImage imageNamed:@"nav_xiala"];
    [titleView addSubview:imageV];
    
    //打开交互
    titleView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cityList)];
    [titleView addGestureRecognizer:tapGesture];
    
    self.navigationItem.titleView = titleView;
}

//左，右navBar
-(void)initLeftAndRightNavgationBar
{
    //左边图片
    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_xiaoxi"] target:self action:nil];
    
    //右边图片
    UIBarButtonItem *imageBBI = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_sousuo"] target:self action:@selector(ImageBBIClick)];
    titleBBI = [SLUIFactory createTitleBBIWithTitle:@"列表" target:self action:@selector(titleBBIClick)];
    
    self.navigationItem.rightBarButtonItems = @[titleBBI,imageBBI];
}


#pragma mark - Event Handlers

//点击切换描述
- (IBAction)btnClick:(UIButton *)sender
{
   
    if ([sender.titleLabel.text isEqualToString:@"只看新房"]) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.describeLable.text = @"全城共232套新房";
            sender.titleLabel.text = @"全部房源";
        });

    }else {
        dispatch_async(dispatch_get_main_queue(), ^{
            sender.titleLabel.text = @"只看新房";
            self.describeLable.text = @"全城共29117套二手房,232套新房";
        });
    }
}

//搜索
-(void)ImageBBIClick
{
    
}

//点击列表
-(void)titleBBIClick
{
    if ([titleBBI.title isEqualToString:@"列表"]) {
        titleBBI.title = @"地图";

    }
    else{
        titleBBI.title = @"列表";
    }
    
}

//点击深圳，出现城市列表
-(void)cityList
{
    SLCityListTableViewController *cityVC  = [[SLCityListTableViewController alloc] init];
    cityVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cityVC animated:YES];
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
