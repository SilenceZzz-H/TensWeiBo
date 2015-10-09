//
//  WeiboModel.m
//  TensWeiBo
//
//  Created by gh on 15-10-8.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "WeiboModel.h"
#import "UserInfoModel.h"

@implementation WeiboModel

- (NSMutableArray *)userModels{
    
    if (_userModels == nil) {
        
        _userModels = [NSMutableArray array];
    }
    return _userModels;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"user"]) {
        
        for (NSDictionary *dic in value) {
            
            UserInfoModel *model = [[UserInfoModel alloc] initWithDictionary:dic];
            
            [self.userModels addObject:model];
        }
        
    }
}


@end
