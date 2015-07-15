//
//  friendinViewControllerTableViewCell.h
//  backplayer
//
//  Created by command.Zi on 14/12/27.
//  Copyright (c) 2014年 command.Zi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Sakura;

@interface friendinViewControllerTableViewCell : UITableViewCell

@property (nonatomic ,strong) Sakura * sakura;  //列表对象
@property (nonatomic ,assign) CGFloat Labelheight;  //单元格高度

@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView; //头像
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;  //用户名
@property (strong, nonatomic) IBOutlet UILabel *createTimeLabel;  //创建日期
@property (strong, nonatomic) IBOutlet UIButton *moreButton;   //更多按钮
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;  //内容Label
@property (strong, nonatomic) IBOutlet UIButton *upButton;  //赞Button
@property (strong, nonatomic) IBOutlet UIButton *downButton;  //倒Button
@property (strong, nonatomic) IBOutlet UIButton *ShareButton;  //分享Button
@property (strong, nonatomic) IBOutlet UIButton *commentButton;   //评论Button
@property (strong, nonatomic) IBOutlet UIImageView *contentImageView;   //评论Button

@property (strong, nonatomic) IBOutlet UIView *moreThenView;


@end
