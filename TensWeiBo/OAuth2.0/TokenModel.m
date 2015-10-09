//
//  TokenModel.m
//  TensWeiBo
//
//  Created by gh on 15-10-7.
//  Copyright (c) 2015年 tens. All rights reserved.
//

#import "TokenModel.h"

@implementation TokenModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

    self.loginDate = [NSDate date];
    
}


- (void)encodeWithCoder:(NSCoder *)coder{

    [coder encodeObject:self.access_token forKey:@"access_token"];
    [coder encodeObject:self.expires_in forKey:@"expires_in"];
    [coder encodeObject:self.uid forKey:@"uid"];
    [coder encodeObject:self.loginDate forKey:@"loginDate"];

}


- (id)initWithCoder:(NSCoder *)aDecoder{

    self = [super init];
    
    if (self) {
        
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.loginDate = [aDecoder decodeObjectForKey:@"loginDate"];
    }
    return self;
}


@end
