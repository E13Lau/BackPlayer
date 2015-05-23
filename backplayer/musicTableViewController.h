//
//  musicTableViewController.h
//  backplayer
//
//  Created by command.Zi on 15/1/5.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "Items.h"

@interface musicTableViewController : UITableViewController <MPMediaPickerControllerDelegate,AVAudioPlayerDelegate>



@end
