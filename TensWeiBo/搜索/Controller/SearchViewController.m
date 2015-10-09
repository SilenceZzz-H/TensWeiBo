//
//  SearchViewController.m
//  TensWeiBo
//
//  Created by gh on 15-10-5.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchView.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addSearchView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSearchView{

    SearchView *searchView = [[SearchView alloc] initWithFrame:CGRectMake(0, 0, TScreenWidth - 20, 30)];

    self.navigationItem.titleView = searchView;
}


@end
