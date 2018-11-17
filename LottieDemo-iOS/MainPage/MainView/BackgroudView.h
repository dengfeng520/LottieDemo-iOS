//
//  BackgroudView.h
//  LottieDemo-iOS
//
//  Created by rp.wang on 2018/11/17.
//  Copyright © 2018 西安乐推网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Lottie/Lottie.h>


NS_ASSUME_NONNULL_BEGIN

@interface BackgroudView : UIView

///显示
-(void)showbackgroundLoadingView;
///隐藏前景动画
-(void)hiddenbackgroundLoadingView;


// 探索动画效果
@property(nonatomic, strong) LOTAnimationView *exploreEffectAV;
// 探索前景动画(全屏滚动)
@property(nonatomic, strong) LOTAnimationView *exploreCoverAV;


@end

NS_ASSUME_NONNULL_END
