//
//  MusicPlayerViewController.m
//  backplayer
//
//  Created by command.Zi on 15/1/7.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//
//  http://msching.github.io/blog/2014/09/07/audio-in-ios-7/
//  待修改为获取URL后使用AVFoundation播放。
//
//
//

#import "MusicPlayerViewController.h"

@interface MusicPlayerViewController () {
    MPMusicPlayerController * musicPlayer;
}

@property (strong, nonatomic) IBOutlet UILabel *musicName;
@property (strong, nonatomic) IBOutlet UIImageView *musicImage;
- (IBAction)musicPlay:(id)sender;
- (IBAction)musicStop:(id)sender;

@end

@implementation MusicPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
    musicPlayer.repeatMode = MPMusicRepeatModeAll;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    [musicPlayer setQueueWithItemCollection:[Items shareItems].musicItemCollection];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)musicPlay:(id)sender {
    if ([Items shareItems].musicItemCollection == nil) {
        NSLog(@"??");
    }
    if ([musicPlayer playbackState] == MPMusicPlaybackStatePlaying) {
        [musicPlayer skipToNextItem];
        self.musicName.text = [musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyTitle];
        MPMediaItemArtwork * artwork = [musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyArtwork];
        UIImage *image = [artwork imageWithSize:CGSizeMake(200, 200)];
        if (![musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyArtwork]) {
            image = [UIImage imageNamed:@"qwe.jpg"];
            self.musicImage.image = image;
        }else {
            self.musicImage.image = image;
        }
    }else {
        [musicPlayer play];
        self.musicName.text = [musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyTitle];
        MPMediaItemArtwork * artwork = [musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyArtwork];
        UIImage *image = [artwork imageWithSize:CGSizeMake(200, 200)];
        if (![musicPlayer.nowPlayingItem valueForProperty:MPMediaItemPropertyArtwork]) {
            image = [UIImage imageNamed:@"qwe.jpg"];
            self.musicImage.image = image;
        }else {
            self.musicImage.image = image;
        }
    }
}

- (IBAction)musicStop:(id)sender {
    [musicPlayer stop];
}

@end
