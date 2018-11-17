//
//  MainViewController+loadAnimation.m
//  LottieDemo-iOS
//
//  Created by rp.wang on 2018/11/17.
//  Copyright © 2018 西安乐推网络科技有限公司. All rights reserved.
//

#import "MainViewController+loadAnimation.h"

@implementation MainViewController (loadAnimation)

-(void)loadView{
    
    [super loadView];
        
    [self createExploreAnimationView];
    
}


-(void)createExploreAnimationView{
    
    self.exploreAnimation = [LOTAnimationView animationNamed:@"explore_btn"];
    [self.exploreAnimation setContentMode:UIViewContentModeScaleToFill];
    [self.view insertSubview:self.exploreAnimation atIndex:1];
    [self.exploreAnimation mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.bottom.equalTo(self.view.mas_bottomMargin).with.offset(-30);
        //
        make.centerX.equalTo(self.view);
        //
        make.size.mas_equalTo(CGSizeMake(73, 73));
    }];
}

// MARK: - 0到15帧 顺序播放动画
-(void)playinOrderAnimation{
    printf("\n0到15帧 顺序播放动画\n");
     self.touchAnimationTap.enabled = false;
    [self.exploreAnimation setLoopAnimation:false];
    [self.exploreAnimation stop];
    [self.exploreAnimation playFromFrame:[NSNumber numberWithInteger:0] toFrame:[NSNumber numberWithInteger:15] withCompletion:^(BOOL animationFinished) {
        
        self.touchAnimationTap.enabled = true;
       
    }];
}

// MARK: - 15-->0 逆序播放
-(void)playReverseAnimation{
    printf("\n15-->0 逆序播放\n");
    self.touchAnimationTap.enabled = false;
    [self.exploreAnimation setLoopAnimation:false];
    
    [self.exploreAnimation playFromFrame:[NSNumber numberWithInteger:15] toFrame:[NSNumber numberWithInteger:0] withCompletion:^(BOOL animationFinished) {
        
        self.touchAnimationTap.enabled = true;
        
    }];
}

// MARK: - 循环播放
-(void)loopPlayAnimation{
    
     __weak typeof (self) weakSelf = self;
    printf("\n循环播放\n");
    self.touchAnimationTap.enabled = false;
    // 循环执行转圈动画
    [self.exploreAnimation setLoopAnimation:true];
    
    [self performSelector:@selector(touchEnabledtrue) withObject:nil afterDelay:10.f];
    //跳转到某一帧
    [weakSelf.exploreAnimation setProgressWithFrame:[NSNumber numberWithInteger:46]];
    [weakSelf.exploreAnimation playFromFrame:[NSNumber numberWithInteger:46] toFrame:[NSNumber numberWithInteger:104] withCompletion:^(BOOL animationFinished) {
        
    }];
}

-(void)touchEnabledtrue
{
    self.touchAnimationTap.enabled = true;
    
    [self.exploreAnimation pause];
}

// MARK: - 组合动画
-(void)combinedPlayAnimation{
    
    printf("\n组合动画播放\n");
    [self.exploreAnimation setLoopAnimation:false];
    //跳转到某一帧
    [self.exploreAnimation setProgressWithFrame:[NSNumber numberWithInteger:46]];
    // 平滑过渡到转圈动画
    [self.exploreAnimation playFromFrame:[NSNumber numberWithInteger:30] toFrame:[NSNumber numberWithInteger:46] withCompletion:^(BOOL animationFinished) {
        
        [self loopPlayAnimation];
        
    }];
}

// MARK: - 暂停动画
-(void)pausePlauAnimation{
    
    printf("\n暂停动画\n");
    [self.backroundView.exploreCoverAV pause];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.backroundView.exploreCoverAV play];
    });
}

@end
