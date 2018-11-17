//
//  MainViewController.m
//  LottieDemo-iOS
//
//  Created by rp.wang on 2018/11/17.
//  Copyright © 2018 西安乐推网络科技有限公司. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //-----------------------
    _touchAnimationTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchExploerView)];
    [self.exploreAnimation addGestureRecognizer:_touchAnimationTap];
 
}


-(void)touchExploerView{
    
    
    int random = [self randomNumber:0 tonumber:8];
    
    printf("============================%d\n\n",random);

    
    switch (random) {
        case 0:
        {
            //顺序播放
            [self playinOrderAnimation];
        }
            break;
        case 1:
        {
            [self playReverseAnimation];
        }
            break;
        case 2:
        {
            [self loopPlayAnimation];
        }
            break;
        case 3:
        {
            [self combinedPlayAnimation];
        }
            break;
        case 4:
        {
            [self.backroundView showbackgroundLoadingView];
        }
            break;
        case 5:
        {
            [self.backroundView hiddenbackgroundLoadingView];
        }
            break;
        case 6:
        {
            [self removeBackroundView];
        }
            break;
        case 7:
        {
            [self pausePlauAnimation];
        }
            break;
        case 8:
        {
            [self removeBackroundView];
        }
            break;
        default:
            break;
    }
    
}


//MARK: - 生成随机数
-(int)randomNumber:(int)from tonumber:(int)tonumber
{
    return (from + (arc4random() % (tonumber - from + 1)));
}


// MARK: - 背景动画
-(BackgroudView *)backroundView{
    
    if(_backroundView == nil){
        
        _backroundView = [[BackgroudView alloc]initWithFrame:self.view.bounds];
        [self.view insertSubview:_backroundView atIndex:0];
    }
    return _backroundView;
}

-(void)removeBackroundView{
    if(_backroundView){
        [_backroundView removeFromSuperview];
        _backroundView = nil;
    }
}


@end
