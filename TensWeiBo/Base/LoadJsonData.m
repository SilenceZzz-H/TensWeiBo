//
//  LoadJsonData.m
//  项目一--新闻浏览
//
//  Created by gh on 15-8-25.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "LoadJsonData.h"

@implementation LoadJsonData

+ (id)jsonDataToObjectWithFielName:(NSString *)fileName{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    
    id object = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    return object;
}

@end
