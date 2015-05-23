//
//  ViewController.m
//  backplayer
//
//  Created by command.Zi on 14/12/17.
//  Copyright (c) 2014年 command.Zi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController () {
    AVAudioPlayer *XYZAVAudioPlayer;   //播放器player
    NSTimer *timer;                 //监控音频播放进度
    NSTimer *stoptimer;            //歌曲结束声量控制
}
- (IBAction)StopBtn:(id)sender;
- (IBAction)PlayBtn:(id)sender;
- (IBAction)PauseBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIProgressView *musicprogress;
@property (strong, nonatomic) IBOutlet UISlider *VolumeSlider;
@property (strong, nonatomic) IBOutlet UISwitch *musicSwith;
@property (strong, nonatomic) IBOutlet UILabel *startTime;
@property (strong, nonatomic) IBOutlet UILabel *stopTime;
@property (strong, nonatomic) IBOutlet UISlider *musicSlider;


@end

@implementation ViewController

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置代理
    XYZAVAudioPlayer.delegate = self;
    
    [self setAudioPlayer];
    // Do any additional setup after loading the view.
}

-(void)setAudioPlayer {
    
    //从budle路径下读取音频文件　　轻音乐 - 萨克斯回家 这个文件名是你的歌曲名字,mp3是你的音频格式
    NSString *string = [[NSBundle mainBundle] pathForResource:@"G.E.M.邓紫棋 - 喜欢你" ofType:@"mp3"];
    //把音频文件转换成url格式
    NSURL *url = [NSURL fileURLWithPath:string];
    //初始化音频类 并且添加播放文件
    XYZAVAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    //设置音乐播放次数  -1为一直循环
    XYZAVAudioPlayer.numberOfLoops = -1;
    
    //预播放
    [XYZAVAudioPlayer prepareToPlay];
    
    //用NSTimer来监控音频播放进度
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self
                                           selector:@selector(playProgress)
                                           userInfo:nil repeats:YES];

    //初始化音量控制
    [self.VolumeSlider addTarget:self action:@selector(volumeChange)
                forControlEvents:UIControlEventValueChanged];
    //设置最小音量
    self.VolumeSlider.minimumValue = 0.0f;
    //设置最大音量
    self.VolumeSlider.maximumValue = 10.0f;
    //初始化音量为多少
    self.VolumeSlider.value = 5.0f;
    
    //声音开关控件(静音)
    [self.musicSwith addTarget:self action:@selector(onOrOff:) forControlEvents:UIControlEventValueChanged];
    //默认状态为打开
    self.musicSwith.on = YES;
    
    //进度条slider控件
    [self.musicSlider addTarget:self action:@selector(playSlider) forControlEvents:UIControlEventValueChanged];

    stoptimer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(selector) userInfo:nil repeats:YES];
}

-(void)stopVolume:(NSTimer *)atimer {
    float a = XYZAVAudioPlayer.volume;
    XYZAVAudioPlayer.volume -= 1.0/30;
    XYZAVAudioPlayer.volume = XYZAVAudioPlayer.volume < 0.00 ? XYZAVAudioPlayer.volume : a;
    if (XYZAVAudioPlayer.volume == a) {
        [atimer invalidate];

    }
}

//进度条控制
-(void)playSlider {
    XYZAVAudioPlayer.currentTime = XYZAVAudioPlayer.duration * self.musicSlider.value;
}

//播放
- (void)play
{
    [XYZAVAudioPlayer play];
}
//暂停
- (void)pause
{
    [XYZAVAudioPlayer pause];
}
//停止
- (void)stop
{
    XYZAVAudioPlayer.currentTime = 0;  //当前播放时间设置为0
    [XYZAVAudioPlayer stop];
}

//播放进度条
- (void)playProgress
{
    //通过音频播放时长的百分比,给progressview进行赋值;
    self.musicprogress.progress = XYZAVAudioPlayer.currentTime/XYZAVAudioPlayer.duration;
    NSLog(@"%f --- %f",XYZAVAudioPlayer.currentTime,XYZAVAudioPlayer.duration);
    self.startTime.text = [NSString stringWithFormat:@"%f",XYZAVAudioPlayer.currentTime];
    self.stopTime.text = [NSString stringWithFormat:@"%f",XYZAVAudioPlayer.duration];

    self.musicSlider.value = XYZAVAudioPlayer.currentTime/XYZAVAudioPlayer.duration;
}

//声音开关(是否静音)
- (void)onOrOff:(UISwitch *)sender
{
    XYZAVAudioPlayer.volume = sender.on;
}

//播放音量控制
//待实现控制系统音量
- (void)volumeChange
{
    XYZAVAudioPlayer.volume = self.VolumeSlider.value;
}

//播放完成时调用的方法  (代理里的方法),需要设置代理才可以调用
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    [timer invalidate]; //NSTimer暂停   invalidate  使...无效;
}

- (IBAction)StopBtn:(id)sender {
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(stopVolume:) userInfo:nil repeats:YES];
    XYZAVAudioPlayer.currentTime = 0;  //当前播放时间设置为0
    [XYZAVAudioPlayer stop];
}

- (IBAction)PlayBtn:(id)sender {
    [XYZAVAudioPlayer play];
}
- (IBAction)PauseBtn:(id)sender {
    [XYZAVAudioPlayer pause];
}

@end
