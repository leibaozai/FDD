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

#import <MapKit/MapKit.h>

@interface SLBuyHouseViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //列表，地图
    UIBarButtonItem *titleBBI;
    
    //详情列表
    UITableView *_tableView;
    //UISegmentedControl *segmentControl;
    
    //地图
    MKMapView *_mapView;
    
}
@property (strong, nonatomic) IBOutlet UILabel *describeLable;
//@property (strong, nonatomic) IBOutlet UIButton *btn;
@end

@implementation SLBuyHouseViewController

#pragma mark - Lifecycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    //中间的titleView
    [self initTitlView];
    
    //左，右navBar
    [self initLeftAndRightNavgationBar];
    
    //加载地图
    //[self detailMap];
}

#pragma mark - Helper Methods

//中间的titleView
-(void)initTitlView
{
    //创建uiview充当容器
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 49)];
    //titleView.backgroundColor = [UIColor lightGrayColor];
    titleView.alpha = 0.5;
    
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

//详情列表
-(void)detailList
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tag = 2;
    [self.view addSubview:_tableView];
    
    //添加表头
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 50)];
    
   UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"二手房", @"新房"]];
    segmentControl.frame = CGRectMake(headerView.frame.size.width/2-120, 10, 240, 30);
    [segmentControl addTarget:self action:@selector(tableViewChange:) forControlEvents:UIControlEventValueChanged];
    
    [headerView addSubview:segmentControl];
    
    _tableView.tableHeaderView = headerView;
    
    _tableView.autoresizesSubviews = NO;
    //注册cell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

//详情地图
-(void)detailMap
{
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 64 + 49, self.view.frame.size.width, self.view.frame.size.height - 64 - 49)];
    _mapView.tag = 1;
    //设置初始化位置
    //经纬度
    /*
     经度范围：73°E至135°E
     纬度范围：3°N至53°N
     */
    CLLocationDegrees longitude = (73  + 135) / 2.0;
    CLLocationDegrees latitude = (3 + 53) / 2.0;
    
    longitude = 113.950052;
    latitude = 22.543357;
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    
    //设置显示范围
    MKCoordinateSpan span = MKCoordinateSpanMake(0.3, 0.2);
    
    //打包交给地图
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    
    //移动地图
    [_mapView setRegion:region animated:YES];
    
    //地图类型
    _mapView.mapType = MKMapTypeStandard;
    
    [self.view addSubview:_mapView];
}

#pragma mark - Event Handlers

//点击segmentController切换tableView
-(void)tableViewChange:(UISegmentedControl *)sender
{
    
}


//点击切换描述
- (IBAction)btnClick:(UIButton *)sender
{
   
    if ([sender.titleLabel.text isEqualToString:@"只看新房"]) {
        
        [sender setTitle:@"全部房源" forState:UIControlStateNormal];
        self.describeLable.text = @"全城共232套新房";
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            sender.titleLabel.text = @"全部房源";
//            self.describeLable.text = @"全城共232套新房";
//        });

    }else {
        [sender setTitle:@"只看新房" forState:UIControlStateNormal];
        self.describeLable.text = @"全城共29117套二手房,232套新房";
        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            sender.titleLabel.text = @"只看新房";
//            self.describeLable.text = @"全城共29117套二手房,232套新房";
//            
//        });
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
        
        //UITableView *tableV = [self.view viewWithTag:2];
        [_mapView removeFromSuperview];
        [self detailList];
    }
    else{
        titleBBI.title = @"列表";
        [_tableView removeFromSuperview];
        [self detailMap];
    }
    
}

//点击深圳，出现城市列表
-(void)cityList
{
    SLCityListTableViewController *cityVC  = [[SLCityListTableViewController alloc] init];
    cityVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cityVC animated:YES];
}

#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


@end
