//
//  WeiBoAnimationView.m
//  TensWeiBo
//
//  Created by gh on 15-10-6.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "WeiBoAnimationView.h"

@interface WeiBoAnimationView()

@property (strong, nonatomic) UIImageView *sloganView;
@property (strong, nonatomic) UIButton *closeViewButton;

@property (strong, nonatomic) NSMutableArray *buttonArray;

@end

@implementation WeiBoAnimationView

+ (instancetype)creat{

    return [[self alloc] init];
}

- (void)showAnimationView{

    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.frame = keyWindow.bounds;
    self.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    [keyWindow addSubview:self];
    
    [self setViewAnimationIsShow];

    [self addSubview:self.sloganView];
    [self creatSelectButton];
    [self addSubview:self.closeViewButton];
    
    [self setButtonAnimationIsShow:YES];
    
}


- (NSMutableArray *)buttonArray{

    if (_buttonArray == nil) {
        
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}


#pragma mark - 添加动画
// 按钮出现与消失时动画
- (void)setButtonAnimationIsShow:(BOOL)isShow{
    
    CGFloat oneRowY = 300;
    CGFloat twoRowY = 420;
    CGFloat delay = 0;
    
    if (!isShow) {
        oneRowY = TScreenHeight;
        twoRowY = TScreenHeight + 120;
        delay = 0.5;
    }
    
    for (UIButton *button in self.buttonArray) {
        
        [UIView animateWithDuration:0.8 delay:delay usingSpringWithDamping:0.75 initialSpringVelocity:0 options:0 animations:^{
            
            button.y = button.tag < 3 ? oneRowY : twoRowY;
            
        } completion:^(BOOL finished) {
            
        }];
        
        delay = isShow ? delay + 0.07 : delay - 0.07;
        
    }
    
    
}

// view的出现动画
- (void)setViewAnimationIsShow{

    CATransition *transition = [CATransition animation];
    
    // 设置转场动画的类型
    transition.type = kCATransitionMoveIn;
    transition.duration = 0.2;
    
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    // 设置转场动画的方向
    transition.subtype = kCATransitionFromTop;
    
    [self.layer addAnimation:transition forKey:@"transition"];
    
}


#pragma mark - buttonAction
// 点击选择按钮时的动画
- (void)clickButtonAction:(UIButton *)button{
 
    [UIView animateWithDuration:0.5 animations:^{
        
        button.transform = CGAffineTransformMakeScale(1.5, 1.5);
        button.alpha = 0;
    }];
    
    [self.buttonArray removeObject:button];
    for (UIButton *button in self.buttonArray) {
        
        [UIView animateWithDuration:0.5 animations:^{
            button.transform = CGAffineTransformMakeScale(0.5, 0.5);
            button.alpha = 0;
        }];
        
    }
    
    [UIView animateWithDuration:0.8 animations:^{
        
        self.alpha = 0;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self removeFromSuperview];
    });
    
}

// 关闭view
- (void)closeButtonAction:(UIButton *)button{

    [self setButtonAnimationIsShow:NO];
    
    [UIView animateWithDuration:0.8 animations:^{
        
        self.alpha = 0;
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [self removeFromSuperview];
    });
}


#pragma mark - 创建视图
- (UIImageView *)sloganView{

    if (_sloganView == nil) {
        
        _sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"compose_slogan"]];
        _sloganView.frame = CGRectMake((TScreenWidth - 254)/2, 80, 254, 96);
        _sloganView.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _sloganView;
}


- (void)creatSelectButton{

    NSArray *buttonImages = @[@"tabbar_compose_idea",
                              @"tabbar_compose_photo",
                              @"tabbar_compose_camera",
                              @"tabbar_compose_lbs",
                              @"tabbar_compose_review",
                              @"tabbar_compose_more"];
    
    NSArray *buttonTitles = @[@"文字",@"相册",@"相机",@"签到",@"点评",@"更多"];
    
//    CGFloat buttonWidth = (TScreenWidth - 60) / 3;
    CGFloat buttonWidth = 80;
    CGFloat buttonHeight = 110;
    
    for (int i = 0; i < 6; i++) {
    
        CGFloat buttonX = (TScreenWidth - 240)/4 + (buttonWidth + (TScreenWidth - 240)/4) * (i % 3);
//        CGFloat buttonX = 10 + (buttonWidth + 20) * (i % 3);
        CGFloat buttonY = TScreenHeight + 120 * (i / 3) ;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
//        button.backgroundColor = [UIColor blueColor];
        [button setImage:[UIImage imageNamed:buttonImages[i]] forState:UIControlStateNormal];
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
     
        // 设置按钮标题和图片的四周偏移
//        CGFloat titleLeft  = TScreenWidth > 320 ? -75 : -70;
//        CGFloat imageLeft = TScreenWidth > 320 ? 15 : 8;
        
        [button setTitleEdgeInsets:UIEdgeInsetsMake(90, -74, 0, 0)];
        [button setImageEdgeInsets:UIEdgeInsetsMake(-10, 4, 0, 0)];
        
        [self addSubview:button];
        
        [self.buttonArray addObject:button];
    }
    
}

- (UIButton *)closeViewButton{

    if (_closeViewButton == nil) {
        
        _closeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _closeViewButton.frame = CGRectMake(0, TScreenHeight - 40, TScreenWidth, 40);
        
        [_closeViewButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        
        [_closeViewButton setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_close"] forState:UIControlStateNormal];
        
        [_closeViewButton addTarget:self action:@selector(closeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _closeViewButton;
}


@end
