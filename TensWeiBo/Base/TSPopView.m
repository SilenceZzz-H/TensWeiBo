//
//  TSPopView.m
//  TensWeiBo
//
//  Created by gh on 15-10-6.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSPopView.h"
#import "UIView+Extension.h"

@interface TSPopView()

@property (strong, nonatomic) UIImageView *popImageView;

@end

@implementation TSPopView

+ (instancetype)creat{

    return [[self alloc] init];
}

- (void)showPopView:(UIView *)view withType:(PopViewType)type{

    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.frame = keyWindow.bounds;
    
    [keyWindow addSubview:self];
    
    CGRect newFrame = [view convertRect:view.bounds toView:keyWindow];
    
    self.popImageView.y = CGRectGetMaxY(newFrame);
    
    NSString *imageName = nil;
    if (type == PopViewIsLeft) {
    
        imageName = @"popover_background_left";
        self.popImageView.x = CGRectGetMinX(newFrame);
        
    } else if (type == PopViewIsCenter) {
    
        imageName = @"popover_background";
        self.popImageView.centerX = CGRectGetMidX(newFrame);
        
    } else if (type == PopViewIsRight) {
    
        imageName = @"popover_background_right";
        self.popImageView.x = CGRectGetMaxX(newFrame) - CGRectGetWidth(self.popImageView.frame);
        
    }
    
    UIImage *bgImage = [UIImage imageNamed:imageName];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:10 topCapHeight:20];
    self.popImageView.image = bgImage;
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [self removeFromSuperview];
}


- (void)setContentView:(UIView *)contentView{

    _contentView = contentView;
    contentView.x = 5;
    contentView.y = 12;
    
    self.popImageView.width = contentView.width + 10;
    self.popImageView.height = contentView.height + 20;
    
    [self.popImageView addSubview:contentView];

}


- (UIImageView *)popImageView{

    if (_popImageView == nil) {
     
        _popImageView = [[UIImageView alloc] init];
        _popImageView.userInteractionEnabled = YES;
        
        [self addSubview:_popImageView];
    }
    return _popImageView;
}


@end
