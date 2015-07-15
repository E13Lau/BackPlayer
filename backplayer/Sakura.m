//
//  Sakura.m
//  backplayer
//
//  Created by command.Zi on 15/1/3.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import "Sakura.h"

@implementation Sakura

- (Sakura *)initWithDictionary:(NSDictionary *)dic{
    if (self  = [super init]) {
        self.Id = [dic[@"Id"] longLongValue];
        self.profileImageUrl = dic[@"profileImageUrl"];
        self.userName = dic[@"userName"];
        self.createAt = dic[@"createAt"];
        self.source = dic[@"source"];
        self.text = dic[@"text"];
        
    }
    return self;
}

+(Sakura *)SakuraWithDictionary:(NSDictionary *)dic{
    Sakura * sakura = [[Sakura alloc]initWithDictionary:dic];
    return sakura;
}

@end
