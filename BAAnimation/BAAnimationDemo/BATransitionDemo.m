//
//  BATransitionDemo.m
//  BAAnimation
//
//  Created by 博爱 on 2017/1/5.
//  Copyright © 2017年 DS-Team. All rights reserved.
//

#import "BATransitionDemo.h"
#import "UIView+BATransition.h"

@interface BATransitionDemo ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titlesArray;

@end

@implementation BATransitionDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ba_changeBackgroundImageWithImageName:@"boaiImage2"];
}

- (void)ba_changeBackgroundImageWithImageName:(NSString *)imageName
{
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.alpha = 0.5f;
    self.tableView.backgroundView = imageView;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = _titlesArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            [self ba_transitonWithType:BATransitionTypeFade];
            break;
            
        case 1:
            [self ba_transitonWithType:BATransitionTypePush];
            break;
            
        case 2:
            [self ba_transitonWithType:BATransitionTypeReveal];
            break;
            
        case 3:
            [self ba_transitonWithType:BATransitionTypeMoveIn];
            break;
            
        case 4:
            [self ba_transitonWithType:BATransitionTypeCube];
            break;
            
        case 5:
            [self ba_transitonWithType:BATransitionTypeSuckEffect];
            break;
            
        case 6:
            [self ba_transitonWithType:BATransitionTypeOglFlip];
            break;
            
        case 7:
            [self ba_transitonWithType:BATransitionTypeRippleEffect];
            break;
            
        case 8:
            [self ba_transitonWithType:BATransitionTypePageCurl];
            break;
            
        case 9:
            [self ba_transitonWithType:BATransitionTypePageUnCurl];
            break;
            
        case 10:
            [self ba_transitonWithType:BATransitionTypeCameraIrisHollowOpen];
            break;
            
        case 11:
            [self ba_transitonWithType:BATransitionTypeCameraIrisHollowClose];
            break;
            
        case 12:
            [self.navigationController.view ba_transitionViewWithDuration:0.8f
                                                           animationCurve:UIViewAnimationCurveEaseInOut transition:UIViewAnimationTransitionCurlDown
                                                                  forView:self.navigationController.view];
            break;
            
        case 13:
            [self.navigationController.view ba_transitionViewWithDuration:0.8f
                                                       animationCurve:UIViewAnimationCurveEaseInOut transition:UIViewAnimationTransitionCurlUp
                                                              forView:self.navigationController.view];
            break;
            
        case 14:
            [self.navigationController.view ba_transitionViewWithDuration:0.8f
                                                           animationCurve:UIViewAnimationCurveEaseInOut transition:UIViewAnimationTransitionFlipFromLeft
                                                                  forView:self.navigationController.view];
            break;
            
        case 15:
            [self.navigationController.view ba_transitionViewWithDuration:0.8f
                                                           animationCurve:UIViewAnimationCurveEaseInOut transition:UIViewAnimationTransitionFlipFromRight
                                                                  forView:self.navigationController.view];
            break;

        default:
            break;
    }
    
    static int i = 0;
    if (i == 0) {
        [self ba_changeBackgroundImageWithImageName:@"boaiImage1"];
        i = 1;
    }
    else
    {
        [self ba_changeBackgroundImageWithImageName:@"boaiImage2"];
        i = 0;
    }
}

- (void)ba_transitonWithType:(BATransitionType)type
{
    [self.navigationController.view ba_transitionWithType:type
                                                  subType:BATransitionSubtypeFromLeft
                                                 duration:0.8f
                                           timingFunction:BATransitionTimingFunctionTypeEaseInEaseOut
                                      removedOnCompletion:YES
                                                  forView:self.navigationController.view];
}

- (NSArray *)titlesArray
{
    if (!_titlesArray)
    {
        _titlesArray = @[@"淡化效果",
                         @"Push效果",
                         @"揭开效果",
                         @"覆盖效果",
                         @"3D立方效果",
                         @"吮吸效果",
                         @"翻转效果",
                         @"波纹效果",
                         @"翻页效果",
                         @"反翻页效果",
                         @"开镜头效果",
                         @"关镜头效果",
                         @"下翻页效果",
                         @"上翻页效果",
                         @"左翻转效果",
                         @"右翻转效果"];
    }
    return _titlesArray;
}

@end
