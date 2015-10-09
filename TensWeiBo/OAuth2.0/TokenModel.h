//
//  TokenModel.h
//  TensWeiBo
//
//  Created by gh on 15-10-7.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSBaseModel.h"

@interface TokenModel : TSBaseModel

/**
 *   {
 "access_token" = "2.00CX2yOGID5mlB45a1f6d465NlUhZD";
 "expires_in" = 157679999;
 uid = 5718048148;
 }
 */

@property (copy, nonatomic) NSString *access_token;
@property (strong, nonatomic) NSNumber *expires_in;
@property (strong, nonatomic) NSNumber *uid;

@property (strong, nonatomic) NSDate *loginDate;

@end
