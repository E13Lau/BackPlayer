//
//  Items.h
//  backplayer
//
//  Created by command.Zi on 15/1/7.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface Items : NSObject

@property (strong, nonatomic) MPMediaItemCollection * musicItemCollection;

+(Items *)shareItems;
@end
