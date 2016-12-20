//
//  DemoVC_09.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/19.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "DemoVC_09.h"
#import "DemoVC_09_Detail.h"


/**
 *  获取屏幕宽度和高度
 */
#define BA_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define BA_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)


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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (0 == indexPath.section)
    {
        DemoVC_09_Detail *vc = [DemoVC_09_Detail new];
        vc.animationType = @(indexPath.row).intValue;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (1 == indexPath.section)
    {
        DemoVC_09_Detail *vc = [DemoVC_09_Detail new];
        vc.animationType = @(indexPath.row).intValue + 7;
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
        title = @"CAAnimationGroup 组动画";
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
                                         @"name":@"7、转场动画"
                                         }]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、缩放动画"
                                         },
                                     @{
                                         @"name":@"2、拉伸变化"
                                         },
                                     @{
                                         @"name":@"3、中心位置"
                                         }
                                     ]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、缩放动画"
                                         },
                                     @{
                                         @"name":@"2、拉伸变化"
                                         },
                                     @{
                                         @"name":@"3、中心位置"
                                         }
                                     ]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、缩放动画"
                                         },
                                     @{
                                         @"name":@"2、拉伸变化"
                                         },
                                     @{
                                         @"name":@"3、中心位置"
                                         }
                                     ]
                             },
                         @{
                             DemoVC_09_title : @[
                                     @{
                                         @"name":@"1、缩放动画"
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
