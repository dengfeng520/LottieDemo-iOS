//
//  MainViewController.h
//  LottieDemo-iOS
//
//  Created by rp.wang on 2018/11/17.
//  Copyright © 2018 西安乐推网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <Lottie/Lottie.h>
#import "BackgroudView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController


// !!!: - ===============================
@property (strong, nonatomic) BackgroudView *backroundView;
///点击手势
@property(strong, nonatomic) UITapGestureRecognizer *touchAnimationTap;
//
@property (strong, nonatomic)  LOTAnimationView *exploreAnimation;


// !!!: - ===============================
//0到15帧 顺序播放动画
-(void)playinOrderAnimation;
//15-->0 逆序播放
-(void)playReverseAnimation;
//循环播放
-(void)loopPlayAnimation;
//组合动画
-(void)combinedPlayAnimation;
//暂停动画
-(void)pausePlauAnimation;

@end

NS_ASSUME_NONNULL_END
