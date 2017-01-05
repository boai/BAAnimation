//
//  DemoVC_09.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/19.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "DemoVC_09.h"
#import "DemoVC_09_Detail.h"
#import "BACABasicAnimationDemo.h"
#import "BACAKeyframeAnimationDemo.h"
#import "BADownloadViewDemo.h"
#import "BATransitionDemo.h"

#import "BAAnimationHeader.h"


#define DemoVC_09_title @"title"

@interface DemoVC_09 ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *titlesArray;


@end

@implementation DemoVC_09

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"博爱动画 demo";
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.titlesArray[section][DemoVC_09_title];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }

    cell.textLabel.text = _titlesArray[indexPath.section][DemoVC_09_title][indexPath.row][@"name"];

    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.section)
    {
        DemoVC_09_Detail *vc = [DemoVC_09_Detail new];
        vc.title = @"UIView 基本动画";
        vc.animationType = @(indexPath.row).intValue;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (1 == indexPath.section)
    {
        BACABasicAnimationDemo *vc = [BACABasicAnimationDemo new];
        vc.title = @"CABasicAnimation 经典动画";
//        vc.animationType = @(indexPath.row).intValue;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (2 == indexPath.section)
    {
        BATransitionDemo *vc = [BATransitionDemo new];
        vc.title = @"CATransition 转场动画";
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (3 == indexPath.section)
    {
        BACAKeyframeAnimationDemo *vc = [BACAKeyframeAnimationDemo new];
        vc.title = @"CAKeyframeAnimation 关键帧动画";
        vc.animationType = @(indexPath.row).intValue;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (4 == indexPath.section)
    {
        BADownloadViewDemo *vc = [BADownloadViewDemo new];
//        vc.title = @"其他动画";
//        vc.animationType = @(indexPath.row).intValue;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [UIView new];
    headView.frame = CGRectMake(0, 0, BA_SCREEN_WIDTH, 30);
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(10, 0, BA_SCREEN_WIDTH - 20, headView.frame.size.height);
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    [headView addSubview:titleLabel];
    
    NSString *title;
    if (0 == section)
    {
        title = @"UIView 基本动画";
    }
    else if (1 == section)
    {
        title = @"CABasicAnimation 经典动画";
    }
    else if (2 == section)
    {
        title = @"CATransition 转场动画";
    }
    else if (3 == section)
    {
        title = @"CAKeyframeAnimation 关键帧动画";
    }
    else if (4 == section)
    {
        title = @"其他动画";
    }
    titleLabel.text = title;
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (NSArray *)titlesArray
{
    if (!_titlesArray)
    {
        _titlesArray = @[
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、大小变化【改变 frame】"
                                         },
                                     @{
                                         @"name":@"2、拉伸变化【改变 bounds】"
                                         },
                                     @{
                                         @"name":@"3、中心位置【改变 center】"
                                         },
                                     @{
                                         @"name":@"4、透明度  【改变 alpha】"
                                         },
                                     @{
                                         @"name":@"5、弹簧 Spring 动画"
                                         },
                                     @{
                                         @"name":@"6、背景颜色【改变 backgroundColor】"
                                         },
                                     @{
                                         @"name":@"7、缩放动画"
                                         }
                                     ]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、播放器动画"
                                         }
                                     ]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、CATransition 转场动画合集"
                                         }
                                     ]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、Loading1"
                                         },
                                     @{
                                         @"name":@"2、Loading2"
                                         },
                                     @{
                                         @"name":@"3、Loading3"
                                         },
                                     @{
                                         @"name":@"4、Loading4"
                                         }
                                     ]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、下载动画-水波纹"
                                         },
                                     @{
                                         @"name":@"2、拉伸变化"
                                         },
                                     @{
                                         @"name":@"3、中心位置"
                                         }
                                     ]
                             }
                         ];
    }
    return _titlesArray;
}

@end
