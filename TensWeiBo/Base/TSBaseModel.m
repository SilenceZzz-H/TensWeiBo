//
//  TSBaseModel.m
//  TensNews
//
//  Created by qinglinfu on 15/8/26.
//  Copyright (c) 2015年 十安科技. All rights reserved.
//

#import "TSBaseModel.h"

@implementation TSBaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        
        // 从字典的key中取出对应的value 给与key相同名称的属性赋值。但是如果属性中没有包含所有字典的key相同的属性就会出错。
        if ([dic isKindOfClass:[NSDictionary class]]) {
            
            [self setValuesForKeysWithDictionary:dic];
        }
        else
        {
            NSLog(@"数据不是字典类型");
        }
    }
    return self;
}

// 过滤掉字典中没有对应属性的 key，需要修改的属性可以在这个方法中设置
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}


@end
