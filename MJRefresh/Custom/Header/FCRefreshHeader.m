//
//  FCRefreshHeader.m
//  MJRefresh
//
//  Created by zhanchuanxi on 2023/11/14.
//  Copyright © 2023 小码哥. All rights reserved.
//

#import "FCRefreshHeader.h"

@interface FCRefreshHeader() 
@property (nonatomic, strong) UIImageView *loadingImageView;
@end

@implementation FCRefreshHeader

- (void)prepare{
    
    [super prepare];
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed: (self.loadingImage ? self.loadingImage : @"common_loading_icon_gray")]; 
    [self addSubview:imageView];
    self.loadingImageView = imageView;
}

- (void)placeSubviews
{
    [super placeSubviews];
    self.loadingImageView.frame = CGRectMake(0, 0, 24, 24);
    self.loadingImageView.center = CGPointMake(self.mj_w * 0.5, - self.loadingImageView.mj_h + 20);
}


- (void)startAnimation{
       CABasicAnimation *loadingAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        loadingAnimation.fromValue = [NSNumber numberWithFloat:0.f];
        loadingAnimation.toValue = [NSNumber numberWithFloat: M_PI *2];
        loadingAnimation.duration = self.loadingDuration > 0 ? self.loadingDuration :  1;
        loadingAnimation.autoreverses = NO;
        loadingAnimation.fillMode = kCAFillModeForwards;
        loadingAnimation.repeatCount = MAXFLOAT;
        loadingAnimation.removedOnCompletion = NO;
        [self.loadingImageView.layer addAnimation:loadingAnimation forKey:@"fc_loading_animation_key"];
}

- (void)stopAnimation {
    [self.loadingImageView.layer removeAllAnimations];
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];

}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];

}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;

    switch (state) {
        case MJRefreshStateIdle:
            [self stopAnimation];
            break;
        case MJRefreshStatePulling:
            [self stopAnimation];
            break;
        case MJRefreshStateRefreshing:
            [self startAnimation];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
    //CGFloat red = 1.0 - pullingPercent * 0.5;
    //CGFloat green = 0.5 - 0.5 * pullingPercent;
    //CGFloat blue = 0.5 * pullingPercent;
}


@end
