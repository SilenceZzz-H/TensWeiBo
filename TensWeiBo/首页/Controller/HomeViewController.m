//
//  HomeViewController.m
//  TensWeiBo
//
//  Created by gh on 15-10-5.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "HomeViewController.h"
#import "TSPopView.h"
#import "WeiboCell.h"
#import "TokenModel.h"
#import "AchiverToken.h"
#import "AFNetworking.h"
#import "WeiboModel.h"
#import "LoadJsonData.h"

@interface HomeViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *weiboTableView;

@property (strong, nonatomic) NSMutableArray *weiboModelArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    
//    [params setObject:@"created_at" forKey:@"created_at"];
//    [params setObject:@"text" forKey:@"text"];
//    [params setObject:@"userModels" forKey:@"user"];
    
    TokenModel *model = [AchiverToken unarchiverTokenModle];
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=%@",model.access_token];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObject:@"application/json"];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"JSON: %@", responseObject);

        NSArray *array = [NSArray arrayWithObject:responseObject];

//        id object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];

        
        for (NSDictionary *dic in array) {
            
//            NSLog(@"dic = %@",dic);
            
            WeiboModel *model = [[WeiboModel alloc] initWithDictionary:dic];
            
            [self.weiboModelArray addObject:model];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}


- (void)creatPopView:(UIView *)view withType:(PopViewType)type{

//    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    contentView.backgroundColor = [UIColor whiteColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    button.bounds = CGRectMake(0, 0, 100, 100);
    
    TSPopView *popView = [TSPopView creat];
    popView.contentView = button;
    
    [popView showPopView:view withType:type];
    
}


#pragma mark - buttonAction
- (IBAction)leftButtonAction:(UIButton *)sender {
    
    [self creatPopView:sender withType:PopViewIsLeft];
}

- (IBAction)centerButtonAction:(UIButton *)sender {
    
    [self creatPopView:sender withType:PopViewIsCenter];
}

- (IBAction)rightButton:(UIButton *)sender {
    
    [self creatPopView:sender withType:PopViewIsRight];
}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.weiboModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeiboCell" forIndexPath:indexPath];
    
    cell.model = self.weiboModelArray[indexPath.row];
    
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
