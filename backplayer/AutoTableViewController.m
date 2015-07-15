//
//  AutoTableViewController.m
//  backplayer
//
//  Created by command.Zi on 15/7/12.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import "AutoTableViewController.h"
#import "AutoTableViewCell.h"
#import "Sakura.h"

@interface AutoTableViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSMutableArray * sakuras;
}
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation AutoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.myTableView registerClass:[AutoTableViewCell class] forCellReuseIdentifier:@"Cell"];
    UINib * cellNib = [UINib nibWithNibName:@"firstVC" bundle:nil];
//    [self.myTableView registerNib:cellNib forCellReuseIdentifier:@"Cell"];
    NSString * path = [[NSBundle mainBundle]pathForResource:@"sakurainfo" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    sakuras = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [sakuras addObject:[Sakura SakuraWithDictionary:obj]];
        //        friendinViewControllerTableViewCell * cell = [self.texttableView dequeueReusableCellWithIdentifier:@"cell"];
        //        [sakuraCell addObject:cell];
    }];

    self.myTableView.estimatedRowHeight = 500.f;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return sakuras.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Sakura * content = sakuras[indexPath.row];
    cell.nameLabel.text = content.userName;
    cell.timeLabel.text = content.createAt;
    cell.myImageVIew.image = [UIImage imageNamed:content.profileImageUrl];
    cell.contentLabel.text = content.text;
    cell.contentImageView.image = [UIImage imageNamed:content.profileImageUrl];
    if (indexPath.row == 1) {
        cell.secondLabel.text = @"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    }else {
        cell.secondLabel.text = nil;
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
