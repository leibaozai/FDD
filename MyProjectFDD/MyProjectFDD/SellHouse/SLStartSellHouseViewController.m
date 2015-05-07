//
//  SLStartSellHouseViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLStartSellHouseViewController.h"
#import "SLUIFactory.h"
#import "SLGlobalDefine.h"
#import "SLStartSellVillageNameView.h"


@interface SLStartSellHouseViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    //城市按钮是否点击
    BOOL isCityButtonClick;
    
    //城市详情View
    UIView *cityListView;
    
    //记录选中的城市
    NSInteger clickIndex;
    
    //城市数据
    NSArray *cityArr;
}
@end

@implementation SLStartSellHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发布房源";
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    //初始化城市列表
    [self initCityListView];
}

#pragma mark - Helper Methods

//初始化城市列表
-(void)initCityListView
{
    //获取按钮最大Y值
    CGFloat cityButtonBottom = CGRectGetMaxY(self.cityButton.frame);
    //NSLog(@"%f",cityButtonBottom);
    
    cityListView = [[UIView alloc] initWithFrame:CGRectMake(0, cityButtonBottom, SCREEN_WIDTH, 0)];
    cityListView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cityListView];
    
    //剪切超过父视图的区域
    cityListView.clipsToBounds = YES;
    
    //按钮高度
    CGFloat btnHeight = CGRectGetHeight(self.cityButton.frame);
    //NSLog(@"height%f",btnHeight);
    
    //按钮宽度
    CGFloat btnWidth = SCREEN_WIDTH / 5;
    
    //城市数据
    cityArr = @[@"北京",@"成都",@"重庆",@"广州",@"杭州",@"南京",@"上海",@"深圳",@"苏州",@"天津",@"白山"];
    
    //添加按钮
    for (int i = 0; i < cityArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnWidth * (i%5), btnHeight * (i/5), btnWidth, btnHeight);
        btn.tag = i + 1;
        btn.titleLabel.textAlignment = NSTextAlignmentRight;
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:cityArr[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cityListButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        [cityListView addSubview:btn];
        
        if(i/5){
            UILabel *lineLable = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMinY(btn.frame), SCREEN_WIDTH - 20, 1)];
            lineLable.backgroundColor = [UIColor lightGrayColor];
            [cityListView addSubview:lineLable];
        }
    }
}


#pragma mark - 跳转

-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Event Handlers

//点击城市按钮
- (IBAction)cityButtonClick:(id)sender {
    
    isCityButtonClick = !isCityButtonClick;
    
    //隐藏显示
    [self animationHideOrShowListView:isCityButtonClick];
}

//隐藏或者显示
- (void)animationHideOrShowListView:(BOOL)isCityButtonClick
{
    CGRect frame = cityListView.frame;
    
    if (isCityButtonClick) {
        frame.size.height = self.view.frame.size.height - 64;
    }else{
        frame.size.height = 0;
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        cityListView.frame = frame;
    }];
}

//城市列表按钮点击
-(void)cityListButtonClick:(UIButton *)button
{
    //记录选中的
    clickIndex = button.tag - 1;
    
    [self.cityButton setTitle:cityArr[clickIndex] forState:UIControlStateNormal];
    isCityButtonClick = NO;
    [self animationHideOrShowListView:isCityButtonClick];
}



//点击小区名称按钮
- (IBAction)villageNameButtonClick:(id)sender {
    
    SLStartSellVillageNameView *villageVC = [[SLStartSellVillageNameView alloc] init];
    villageVC.hidesBottomBarWhenPushed = YES;
    
    villageVC.titleStr = self.cityButton.titleLabel.text;
    [self.navigationController pushViewController:villageVC animated:YES];
}

//点击户型
- (IBAction)typeButtonClick:(id)sender {
    //选择器
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 216, SCREEN_WIDTH, 216)];
    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
}

#pragma mark -UIPickerViewdataSource

//组
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

//每组有多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return 8;
    }else if(component == 1){
        return 7;
    }
    return 7;
}

//每行的title
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [NSString stringWithFormat:@"%ld室",row+1];
    }else if (component == 1){
        return [NSString stringWithFormat:@"%ld厅",row];
    }
    return [NSString stringWithFormat:@"%ld卫",row];
}

//选中了某行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger shi;
    NSInteger ting;
    NSInteger wei;
    if (component == 0) {
        shi = row+1;
    }else if (component == 1){
        ting = row+1;
    }else{
        wei = row+1;
    }
    
    [self.typeButton setTitle:nil forState:UIControlStateNormal];
    [self.typeButton setTitle:[NSString stringWithFormat:@"%ld室%ld厅%ld卫",shi,ting,wei] forState:UIControlStateNormal];
}



@end
