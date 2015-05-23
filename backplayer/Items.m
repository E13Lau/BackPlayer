//
//  Items.m
//  backplayer
//
//  Created by command.Zi on 15/1/7.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import "Items.h"

@implementation Items

+ (Items *)shareItems
{
    static dispatch_once_t pred;
    static id shared_manager = nil;
    
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    
    return shared_manager;
}


@end
