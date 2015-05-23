//
//  muiscTableViewCell.h
//  backplayer
//
//  Created by command.Zi on 15/1/5.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface muiscTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *musicNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *musicArtistLabel;
@property (strong, nonatomic) IBOutlet UIImageView *musicImage;

@end
