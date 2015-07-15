//
//  AutoTableViewCell.h
//  backplayer
//
//  Created by command.Zi on 15/7/12.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *myImageVIew;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UILabel *contentLabel;
@property (strong, nonatomic) IBOutlet UIImageView *contentImageView;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;

@end
