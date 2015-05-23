//
//  XYZGGCollectionViewCell.m
//  backplayer
//
//  Created by command.Zi on 14/12/24.
//  Copyright (c) 2014年 command.Zi. All rights reserved.
//

#import "XYZGGCollectionViewCell.h"

@implementation XYZGGCollectionViewCell

- (void)awakeFromNib {
    
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"XYZGGCollectionViewCell" owner:self options:nil];
        
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

@end
