//
//  DemoVC_09_Detail.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/19.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "DemoVC_09_Detail.h"
#import "CALayer+BAKit.h"

/**
 *  获取屏幕宽度和高度
 */
#define BA_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define BA_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define frame_x  self.tomImageView.frame.origin.x
#define frame_y  self.tomImageView.frame.origin.y

@interface DemoVC_09_Detail ()

@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;
@property (weak, nonatomic) IBOutlet UIButton    *animationButton;

- (IBAction)animationButtonAction:(UIButton *)sender;

@end

@implementation DemoVC_09_Detail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tomImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tom%i",self.animationType + 1]]];
    [self.tomImageView setBackgroundColor:[UIColor greenColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)ba_animationChangeFrame
{
    CGRect originalFrame = self.tomImageView.frame;
    CGRect newFrame = CGRectMake(frame_x - 10, frame_y - 100, 150, 100);
    [self.tomImageView ba_animation_changFrameWithDuration:1.5f originalFrame:originalFrame newFrame:newFrame finishBlock:^{
        
    }];
}

- (void)ba_animationChangeBounds
{
    CGRect originalBounds = self.tomImageView.bounds;
    /*! 尽管这个 newFrame 的 x，y 跟原始的不同，动画也只是改变了宽高 */
    CGRect newBounds = CGRectMake(0, 0, 300, 150);
    [self.tomImageView ba_animation_changBoundsWithDuration:1.0f originalBounds:originalBounds newBounds:newBounds finishBlock:^{
        
    }];
}

- (void)ba_animationChangeCenter
{
    CGPoint originalPoint = self.tomImageView.center;
    CGPoint newPoint = CGPointMake(originalPoint.x, originalPoint.y - 150);
    
    [self.tomImageView ba_animation_changCenterWithDuration:1.0f originalCenter:originalPoint newCenter:newPoint finishBlock:^{
        
    }];
}

- (void)ba_animationTransformRotation:(BOOL)isShow
{
    if (isShow)
    {
        [self.tomImageView ba_animation_scaleShowWithDuration:1.5f ratio:1.6f finishBlock:^{
            
        }];
    }
    else
    {
        [self.tomImageView ba_animation_scaleDismissWithDuration:1.5f ratio:1.6f finishBlock:^{
    
        }];
    }

}

- (void)ba_animationChangeAlpha
{
    [self.tomImageView ba_animation_alphaWithDuration:1.5f startAlpha:0.2f finishAlpha:1.0f];
}

- (void)ba_animationChangeBackgroundColor
{
    [UIView animateKeyframesWithDuration:10.0f delay:0.f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:1.0 / 4 animations:^{
            self.tomImageView.backgroundColor = [UIColor colorWithRed:0.9888 green:0.2021 blue:0.1823 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:1.0f / 4 relativeDuration:1.0 / 4 animations:^{
            self.tomImageView.backgroundColor = [UIColor colorWithRed:0.1888 green:0.7021 blue:0.0823 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:2.0f / 4 relativeDuration:1.0 / 4 animations:^{
            self.tomImageView.backgroundColor = [UIColor colorWithRed:0.1888 green:0.2021 blue:0.7823 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.0f / 4 relativeDuration:1.0 / 4 animations:^{
            self.tomImageView.backgroundColor = [UIColor colorWithRed:0.5888 green:0.1021 blue:0.6823 alpha:1.0];
        }];
        [UIView addKeyframeWithRelativeStartTime:3.0f / 4 relativeDuration:1.0 / 4 animations:^{
            self.tomImageView.backgroundColor = [UIColor whiteColor];
        }];
                                     
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
    
}

- (void)ba_animationSpring
{
    CGRect originalRectFrame = self.tomImageView.frame;
    CGRect newFrame = CGRectMake(frame_x - 100, frame_y, originalRectFrame.size.width*0.3, originalRectFrame.size.height*0.3);
    
    [self.tomImageView ba_animation_springWithDuration:1.0f damping:1.0f initialSpringVelocity:4.0f startOptions:UIViewAnimationOptionCurveLinear finishOptions:UIViewAnimationOptionCurveLinear startBlock:^{
        self.tomImageView.frame = newFrame;
    } finishBlock:^{
        self.tomImageView.frame = originalRectFrame;
    }];
}

- (void)ba_animationTransition
{
    [self.tomImageView ba_animation_transitionWithDuration:0.5f startOptions:UIViewAnimationOptionTransitionCrossDissolve finishOptions:UIViewAnimationOptionTransitionCurlDown finishBlock:^{
        
    }];
}

- (IBAction)animationButtonAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
    switch (self.animationType) {
        case 0:
            [self ba_animationChangeFrame];
            break;
        case 1:
            [self ba_animationChangeBounds];
            break;
        case 2:
            [self ba_animationChangeCenter];
            break;
        case 3:
            [self ba_animationChangeAlpha];
            break;
        case 4:
            [self ba_animationSpring];
            break;
        case 5:
            [self ba_animationChangeBackgroundColor];
            break;
        case 6:
            [self ba_animationTransition];
            break;
        case 7:
            [self ba_animationTransformRotation:sender.selected];
            break;
            
        default:
            break;
    }
}



@end
