//
//  SearchView.m
//  TensWeiBo
//
//  Created by gh on 15-10-5.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        [self setSearchView];
    }

    return self;
}


- (void)setSearchView{

    self.borderStyle = UITextBorderStyleNone;
    
    UIImage *bgImage = [UIImage imageNamed:@"search_navigationbar_textfield_background"];
    bgImage = [bgImage stretchableImageWithLeftCapWidth:5 topCapHeight:10];
    self.background = bgImage;
    self.placeholder = @"搜索";
    self.font = [UIFont systemFontOfSize:15];
    self.tintColor = [UIColor grayColor];
    
    self.clearButtonMode = UITextFieldViewModeAlways;
    
    UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    leftView.contentMode = UIViewContentModeScaleAspectFit;
    leftView.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    
}

@end
