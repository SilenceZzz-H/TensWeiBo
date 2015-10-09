//
//  TSPopView.h
//  TensWeiBo
//
//  Created by gh on 15-10-6.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger{
    PopViewIsLeft,
    PopViewIsCenter,
    PopViewIsRight
}PopViewType;

@interface TSPopView : UIView

@property (strong, nonatomic) UIView *contentView;

+ (instancetype)creat;

- (void)showPopView:(UIView *)view withType:(PopViewType)type;

@end
