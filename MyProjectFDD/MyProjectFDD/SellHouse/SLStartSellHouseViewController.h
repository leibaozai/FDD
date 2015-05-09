//
//  SLStartSellHouseViewController.h
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 开始卖房
 */
@interface SLStartSellHouseViewController : UIViewController

//城市
@property (strong, nonatomic) IBOutlet UIButton *cityButton;

//小区名称
@property (strong, nonatomic) IBOutlet UIButton *villageNameButton;

//户型
@property (strong, nonatomic) IBOutlet UIButton *typeButton;


//朝向


//面积
@property (strong, nonatomic) IBOutlet UITextField *areaTextField;


//第几层
@property (strong, nonatomic) IBOutlet UITextField *floorTextField;


//共几层
@property (strong, nonatomic) IBOutlet UITextField *allFloorTextField;


//栋(号)
@property (strong, nonatomic) IBOutlet UITextField *buildingTextField;


//室
@property (strong, nonatomic) IBOutlet UITextField *roomTextField;



//点击城市按钮
- (IBAction)cityButtonClick:(id)sender;

//点击小区名称按钮
- (IBAction)villageNameButtonClick:(id)sender;

//点击户型
- (IBAction)typeButtonClick:(id)sender;

//点击下一步
- (IBAction)nextButtonClick:(id)sender;



@end
