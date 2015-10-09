//
//  AchiverToken.h
//  TensWeiBo
//
//  Created by gh on 15-10-7.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TokenModel;

@interface AchiverToken : NSObject

+ (void)achiverTokenModle:(TokenModel *)model;
+ (TokenModel *)unarchiverTokenModle;

@end
