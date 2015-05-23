//
//  XYZGGViewController.m
//  backplayer
//
//  Created by command.Zi on 14/12/24.
//  Copyright (c) 2014年 command.Zi. All rights reserved.
//

#import "XYZGGViewController.h"
#import "XYZGGCollectionViewCell.h"

@interface XYZGGViewController () <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout> {
    NSMutableArray * menuData;
    
}
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation XYZGGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[XYZGGCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    menuData = [[NSMutableArray alloc]initWithArray:@[@"秒表",@"计分器",@"扫一扫",@"经期记录器",@"卡路里计算器",@"音乐播放器",@"更多"]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark collectionDelegateMethon
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [menuData count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    
    XYZGGCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    cell.cellLabel.text = menuData[indexPath.row];
    return cell;
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
