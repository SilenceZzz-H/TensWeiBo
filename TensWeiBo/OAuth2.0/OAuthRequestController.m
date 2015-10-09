//
//  OAuthRequestController.m
//  TensWeiBo
//
//  Created by gh on 15-10-7.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "OAuthRequestController.h"
#import "AFNetworking.h"
#import "TokenModel.h"
#import "UIWindow+RootViewController.h"
#import "AchiverToken.h"

@interface OAuthRequestController () <UIWebViewDelegate>

@end

@implementation OAuthRequestController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, TScreenWidth, TScreenHeight)];
    webView.delegate = self;
    
    [self.view addSubview:webView];
    
    NSString *urlStr = [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",TSAppKey,TSRedirectURL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    
    [webView loadRequest:request];
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    NSString *url = request.URL.relativeString;
    
    NSRange range = [url rangeOfString:@"code="];
    
    if (range.location != NSNotFound) {
        
        NSString *code = [url substringFromIndex:range.location + range.length];
        NSLog(@"code = %@",code);
        
        [self requestToken:code];
    }

    return YES;
}


- (void)requestToken:(NSString *)code{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    [params setObject:TSAppKey forKey:@"client_id"];
    [params setObject:TSAppSecret forKey:@"client_secret"];
    [params setObject:@"authorization_code" forKey:@"grant_type"];
    [params setObject:code forKey:@"code"];
    [params setObject:TSRedirectURL forKey:@"redirect_uri"];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager POST:AccessTokenURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject = %@",responseObject);
        TokenModel *model = [[TokenModel alloc] initWithDictionary:responseObject];
        
        [AchiverToken achiverTokenModle:model];
        
        UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;

        [keyWindow setWindowRootViewController];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
