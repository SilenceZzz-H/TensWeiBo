//
//  MainTarBarContrillor.m
//  TensWeiBo
//
//  Created by gh on 15-10-5.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "MainTarBarContrillor.h"
#import "SendViewController.h"
#import "WeiBoAnimationView.h"

@interface MainTarBarContrillor ()

@property (strong, nonatomic) UIButton *centerButton;

@end

@implementation MainTarBarContrillor

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTabBarItemSeleted];
}


// 设置TabBarItem被选择时样式
- (void)setTabBarItemSeleted{

    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.tintColor = [UIColor colorWithRed:255/255.0 green:111/255.0 blue:0 alpha:1];
    
    NSArray *selectImages = @[@"tabbar_home_selected",@"tabbar_message_center_selected",@"",@"tabbar_discover_selected",@"tabbar_profile_selected"];
    
    NSArray *viewControllers = self.viewControllers;
    
    [self.tabBar addSubview:self.centerButton];
    
    for (int i = 0; i < viewControllers.count; i++) {
        
        if (i == 2) {
            continue;
        }
        
        UIViewController *viewController = viewControllers[i];
        
        UIImage *selectImage = [UIImage imageNamed:selectImages[i]];
        
        viewController.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }

}

#pragma mark - buttonAction
- (void)centerButtonAction:(UIButton *)button{
    
    WeiBoAnimationView *animationView = [WeiBoAnimationView creat];
    [animationView showAnimationView];
    
}


#pragma mark - 创建视图
- (UIButton *)centerButton{

    if (_centerButton == nil) {
        
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat centerX = CGRectGetMidX(self.tabBar.frame);
        CGFloat height = CGRectGetHeight(self.tabBar.frame);
        
        _centerButton.frame = CGRectMake(centerX - 32, (height - 44)/2, 64, 44);
        
        [_centerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [_centerButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        
        [_centerButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateNormal];
        
        [_centerButton addTarget:self action:@selector(centerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _centerButton;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
