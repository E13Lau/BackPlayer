//
//  friendinViewControllerTableViewCell.m
//  backplayer
//
//  Created by command.Zi on 14/12/27.
//  Copyright (c) 2014年 command.Zi. All rights reserved.
//

#define sakuraTableViewCellAvatarWidth 64 //头像宽度
#define sakuraTableViewCellAvatarHeight 64

#import "friendinViewControllerTableViewCell.h"
#import "Sakura.h"

@implementation friendinViewControllerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"friendinViewControllerTableViewCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

-(void)setSakura:(Sakura *)sakura {
    CGRect avatarRect = CGRectMake(5, 5, sakuraTableViewCellAvatarWidth, sakuraTableViewCellAvatarHeight);
    self.avatarImageView.image = [UIImage imageNamed:sakura.profileImageUrl];
//    self.avatarImageView.frame = avatarRect;
    
    self.contentImageView.image = [UIImage imageNamed:sakura.profileImageUrl];
    
    self.userNameLabel.text = sakura.userName;
    self.createTimeLabel.text = sakura.createAt;
    
    self.contentLabel.text = sakura.text;
    self.contentLabel.numberOfLines = 0; //为0时总是换行
    self.contentLabel.lineBreakMode = NSLineBreakByWordWrapping; //行末格式
    self.contentLabel.frame = CGRectMake(5, 80, 300, [self setHeight:self.contentLabel.text].height);

    self.moreThenView.frame = CGRectMake(0, [self setHeight:self.contentLabel.text].height+85, 310, 38);   //底部ButtonView
    
    self.Labelheight = [self setHeight:self.contentLabel.text].height+127;   //contentLabel高度
    [self layoutIfNeeded];
}

-(CGSize)setHeight:(NSString *)string {
    CGSize size = [string boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    return size;
}

@end
