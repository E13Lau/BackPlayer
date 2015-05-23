//
//  XViewController.m
//  backplayer
//
//  Created by command.Zi on 14/12/23.
//  Copyright (c) 2014年 command.Zi. All rights reserved.
//

#import "XViewController.h"
#import "friendinViewController.h"
#import "musicTableViewController.h"
#import "nearPeopleViewController.h"
#import "NearGroundViewController.h"

@interface XViewController () {
    NSMutableArray * menudata;
}
@property (strong, nonatomic) IBOutlet UITableView *XYZTableView;

@end

@implementation XViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.XYZTableView.delegate = self;
    self.XYZTableView.dataSource = self;
    
    menudata = [[NSMutableArray alloc]initWithArray:@[@[@"朋友圈"],@[@"播放器",@"附近的人"],@[@"附近场馆",@"附近群组"]]];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [menudata count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return [(NSMutableArray *)menudata[0] count];
            break;
        case 1:
            return [(NSMutableArray *)menudata[1] count];
            break;
        case 2:
            return [(NSMutableArray *)menudata[2] count];
            break;
        default:
            return 1;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.textLabel.text = menudata[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NSLog(@"朋友圈");
//        friendinViewController * controller = [[friendinViewController alloc]initWithNibName:@"friendinViewController" bundle:nil];
        friendinViewController * controller = [friendinViewController new];
        [self.navigationController pushViewController:controller animated:YES];
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            NSLog(@"播放器");
            musicTableViewController * controller = [musicTableViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }else if (indexPath.row == 1) {
            NSLog(@"附近的人");
            nearPeopleViewController * controller = [nearPeopleViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            NSLog(@"附近场馆");
        }else if (indexPath.row == 1) {
            NSLog(@"附近群组");
            NearGroundViewController * controller = [NearGroundViewController new];
            [self.navigationController pushViewController:controller animated:YES];
        }
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //
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
