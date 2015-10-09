//
//  WelcomePageController.m
//  TensWeiBo
//
//  Created by gh on 15-10-7.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "WelcomePageController.h"

@interface WelcomePageController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (weak, nonatomic) IBOutlet UIButton *enterWeiBoButton;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation WelcomePageController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addWelcomeImages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addWelcomeImages{

    self.imageScrollView.contentSize = CGSizeMake(TScreenWidth * 4, TScreenHeight);
    
    for (int i = 0; i < 4; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(TScreenWidth * i, 0, TScreenWidth, TScreenHeight)];
        
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        
        [self.imageScrollView addSubview:imageView];
        
    }

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    NSInteger currentPage = scrollView.contentOffset.x / TScreenWidth;
    self.pageControl.currentPage = currentPage;
    
    if (currentPage == 3) {
        
        self.enterWeiBoButton.hidden = NO;
    } else {
    
        self.enterWeiBoButton.hidden = YES;
    }
    
}


- (IBAction)enterButtonAction:(UIButton *)sender {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    keyWindow.rootViewController = [self.storyboard instantiateInitialViewController];
    
}


@end
