//
//  friendinViewController.m
//  backplayer
//
//  Created by command.Zi on 14/12/23.
//  Copyright (c) 2014年 command.Zi. All rights reserved.
//

#import "friendinViewController.h"
#import "friendinViewControllerTableViewCell.h"
#import "Sakura.h"

@interface friendinViewController () {
    NSString * str;
    NSString * str1;
    NSString * str2;
    NSString * str3;
    NSMutableArray * tableviewDataArray;
    NSMutableArray * sakuras;
    NSMutableArray * sakuraCell;
    NSMutableArray * heightArray;
}
@property (strong, nonatomic) IBOutlet UITableView *texttableView;

@end

@implementation friendinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.texttableView.delegate = self;
    self.texttableView.dataSource = self;
    
    [self.texttableView registerNib:[UINib nibWithNibName:@"friendinViewControllerTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self initData];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark 装载数据
-(void)initData {
    NSString * path = [[NSBundle mainBundle]pathForResource:@"sakurainfo" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    sakuras = [NSMutableArray array];
    sakuraCell = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [sakuras addObject:[Sakura SakuraWithDictionary:obj]];
        friendinViewControllerTableViewCell * cell = [self.texttableView dequeueReusableCellWithIdentifier:@"cell"];
        [sakuraCell addObject:cell];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableViewDelegateMethon
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [sakuras count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    friendinViewControllerTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Sakura * sakura = sakuras[indexPath.row];
    cell.sakura = sakura;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    friendinViewControllerTableViewCell * cell = sakuraCell[indexPath.row];
    cell.sakura = sakuras[indexPath.row];
    return cell.Labelheight;
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
