//
//  UserInfoModel.h
//  TensWeiBo
//
//  Created by gh on 15-10-8.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TSBaseModel.h"

@interface UserInfoModel : TSBaseModel

/**
 *  name : 微博名称
 *  url  : 用户地址
 *  profile_image_url : 头像图片地址
 */

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *url;
@property (copy, nonatomic) NSString *profile_image_url;

@end
