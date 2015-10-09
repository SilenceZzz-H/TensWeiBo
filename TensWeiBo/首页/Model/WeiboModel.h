//
//  WeiboModel.h
//  TensWeiBo
//
//  Created by gh on 15-10-8.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSBaseModel.h"

@interface WeiboModel : TSBaseModel

@property (strong, nonatomic) NSDate *created_at;
@property (copy, nonatomic) NSString *text;
@property (strong, nonatomic) NSMutableArray *userModels;

@end
