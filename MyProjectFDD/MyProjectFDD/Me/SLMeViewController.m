//
//  SLMeViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLMeViewController.h"
#import "SLUIFactory.h"
#import "SLMeTBHeader.h"

#import "SLLoginViewController.h"


@interface SLMeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    SLMeTBHeader *headerVC;
}

@end

@implementation SLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.title = @"我";
    
    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_xiaoxi"] target:self action:nil];
    
    //自动调节视图
    self.tableView.autoresizesSubviews = NO;
    
    //添加表头
    headerVC = [[SLMeTBHeader alloc] initWithNibName:@"SLMeTBHeader" bundle:nil];
    
    //通过tag找出登录按钮 tag--10
    UIButton *loginButton = (UIButton *)[headerVC.view viewWithTag:10];
    [loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    headerVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, 190);
    self.tableView.tableHeaderView = headerVC.view;
    
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    l.backgroundColor = [UIColor lightGrayColor];
    self.tableView.tableFooterView = l;
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark - Event Handlers

//登录
-(void)loginButtonClick:(UIButton *)sender
{
    SLLoginViewController *loginVC = [[SLLoginViewController alloc] init];
    loginVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:loginVC animated:YES];
}

#pragma mark -cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark -UITableViewDataSource

//分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

//每个分区有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else if (section == 1){
        return 3;
    }else
    {
        return 1;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //右边箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //赋值
    UIImageView *ig = [[UIImageView alloc] initWithFrame:CGRectMake(20, 8, 25, 25)];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, 200, 30)];
    lable.font = [UIFont systemFontOfSize:15];
    
    NSArray *imageArr1 = @[@"wo_duoduohui",@"wo_qianbao",@"wo_soucang"];
    NSArray *imageArr2 = @[@"wo_rili",@"wo_zushou",@"wo_jinzhi"];
    
    NSArray *strArr1 = @[@"多多惠",@"钱包",@"房源收藏"];
    NSArray *strArr2 = @[@"经纪人看房日历",@"驻守经纪人管理",@"屏蔽过的经纪人"];
    
    if (indexPath.section == 0) {
        
        ig.image = [UIImage imageNamed:imageArr1[indexPath.row]];
        lable.text = strArr1[indexPath.row];

    }else if (indexPath.section == 1){
        
        ig.image = [UIImage imageNamed:imageArr2[indexPath.row]];
        lable.text = strArr2[indexPath.row];
    }
    else{
        
        ig.image = [UIImage imageNamed:@"wo_shezhi"];
        lable.text = @"设置";
    }
    
    [cell.contentView addSubview:ig];
    [cell.contentView addSubview:lable];
    return cell;
}

//段头（页眉）视图高度，某个20
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

//分区头部
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    l.backgroundColor = [UIColor lightGrayColor];
    return l;
}

@end
