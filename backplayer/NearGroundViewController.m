//
//  NearGroundViewController.m
//  backplayer
//
//  Created by command.Zi on 15/1/26.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import "NearGroundViewController.h"

@interface NearGroundViewController ()

@end

@implementation NearGroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZBarReaderView * reader = [ZBarReaderView new];
    reader.readerDelegate = self;
    reader.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    reader.scanCrop = CGRectMake(0, 0, 100, 100);
    reader.torchMode = 0;
    
    [self.view addSubview:reader];
    
    [reader start];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
