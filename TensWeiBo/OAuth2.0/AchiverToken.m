//
//  AchiverToken.m
//  TensWeiBo
//
//  Created by gh on 15-10-7.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#define TokenAchiverPath  [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"tokenModel.plist"]

#import "AchiverToken.h"
#import "TokenModel.h"

@implementation AchiverToken

+ (void)achiverTokenModle:(TokenModel *)model{

    [NSKeyedArchiver archiveRootObject:model toFile:TokenAchiverPath];
    
}


+ (TokenModel *)unarchiverTokenModle{

    TokenModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:TokenAchiverPath];
    
    NSDate *endDate = [model.loginDate dateByAddingTimeInterval:[model.expires_in doubleValue]];
    
    NSComparisonResult result = [[NSDate date] compare:endDate];

    if (result == NSOrderedDescending) {
        
        return nil;
    }
    
    return model;
}

@end
