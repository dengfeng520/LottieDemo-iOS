//
//  BackgroudView.m
//  LottieDemo-iOS
//
//  Created by rp.wang on 2018/11/17.
//  Copyright © 2018 西安乐推网络科技有限公司. All rights reserved.
//

#import "BackgroudView.h"


@interface BackgroudView ()


// 前景动画背景对象
@property(nonatomic, strong) LOTKeypath *exploreAnimationBgKeyPath;
// 前景动画需要更改的颜色
@property(nonatomic, strong) LOTColorValueCallback *exploreAnimationBgColorCallBack;

@end

@implementation BackgroudView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
        //
        _exploreAnimationBgKeyPath = [LOTKeypath keypathWithString:@"BG.矩形 1.填充 1.Color"];
        _exploreAnimationBgColorCallBack = [LOTColorValueCallback withCGColor:[UIColor clearColor].CGColor];
        self.backgroundColor = [UIColor colorWithRed:(((0x636CEF & 0xFF0000) >> 16))/255.0 green:(((0x636CEF &0xFF00) >>8))/255.0 blue:((0x636CEF &0xFF))/255.0 alpha:1.0];
        
        
    }
    return self;
}

// MARK: - 显示
-(void)showbackgroundLoadingView{

    self.alpha = 0;
    
    if (!self.exploreCoverAV.isAnimationPlaying) {
        [self.exploreCoverAV play];
    }
    
    if (!self.exploreEffectAV.isAnimationPlaying) {
        [self.exploreEffectAV play];
    }

    [UIView animateWithDuration:0.35f animations:^{
        
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}


// MARK: - 隐藏探索前景动画(全屏滚动)
-(void)hiddenbackgroundLoadingView{

    if (_exploreEffectAV) {
        [UIView animateWithDuration:0.8 animations:^{
            [self->_exploreEffectAV setAlpha:0];
        } completion:^(BOOL finished) {
            
            [self removeexploreEffectAV];
        }];
    }else{
        [self.exploreCoverAV play];
    }
}

-(void)removeexploreEffectAV{
    if(_exploreEffectAV){
        [_exploreEffectAV stop];
        [_exploreEffectAV removeFromSuperview];
        _exploreEffectAV = nil;
    }
}


- (LOTAnimationView *)exploreCoverAV {
    if (_exploreCoverAV == nil) {
        _exploreCoverAV = [LOTAnimationView animationNamed:@"main_bg"];
        [_exploreCoverAV setLoopAnimation:true];
        [_exploreCoverAV setValueDelegate:_exploreAnimationBgColorCallBack forKeypath:_exploreAnimationBgKeyPath];
        [_exploreCoverAV setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [_exploreCoverAV setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:_exploreCoverAV];
    }
    return _exploreCoverAV;
}

- (LOTAnimationView *)exploreEffectAV
{
    if (_exploreEffectAV == nil) {
        int x = 1 + (arc4random()%3);
        _exploreEffectAV = [LOTAnimationView animationNamed:[NSString stringWithFormat:@"explore_effects_%d", x]];
        [_exploreEffectAV setLoopAnimation:true];
        [_exploreEffectAV setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [_exploreEffectAV setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:_exploreEffectAV];
        [self insertSubview:_exploreEffectAV belowSubview:self.exploreCoverAV];
    }
    return _exploreEffectAV;
}

@end
