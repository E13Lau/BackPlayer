//
//  Sakura.h
//  backplayer
//
//  Created by command.Zi on 15/1/3.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sakura : NSObject

#pragma mark - 属性
@property (nonatomic ,assign) long long Id;

@property (nonatomic ,copy) NSString * profileImageUrl;//头像

@property (nonatomic ,copy) NSString * userName;//发送用户

@property (nonatomic ,copy) NSString * createAt;//创建日期

@property (nonatomic ,copy) NSString * source;//设备来源

@property (nonatomic ,copy) NSString * text;//微博内容

#pragma mark - 方法
#pragma mark 根据字典初始化微博对象
- (Sakura * )initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化微博对象（静态方法）
+ (Sakura *)SakuraWithDictionary:(NSDictionary *)dic;

@end
