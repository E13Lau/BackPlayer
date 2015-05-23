//
//  musicTableViewController.m
//  backplayer
//
//  Created by command.Zi on 15/1/5.
//  Copyright (c) 2015年 command.Zi. All rights reserved.
//

#import "musicTableViewController.h"
#import "muiscTableViewCell.h"

@interface musicTableViewController () {
    NSMutableArray  * musicNameArray;
    NSMutableArray * musicArtistArray;
    MPMediaPickerController * picker;
    NSMutableDictionary * musicDictionary;
    NSArray * musicArray;
    MPMusicPlayerController * musicPlayer;
    MPMediaItemCollection * AAA;
}

@property (strong, nonatomic) MPMusicPlayerController *player;
@property (strong, nonatomic) MPMediaItemCollection *collection;

@end

@implementation musicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"muiscTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    musicNameArray = [[NSMutableArray alloc]init];
    musicArray = [[NSMutableArray alloc]init];
    musicArtistArray = [[NSMutableArray alloc]init];
    musicDictionary = [[NSMutableDictionary alloc]init];
    
    MPMediaType mediaType = MPMediaTypeMusic;
    picker = [[MPMediaPickerController alloc] initWithMediaTypes:mediaType];
    picker.delegate = self;
    [picker setAllowsPickingMultipleItems:YES];
    
    musicPlayer = [MPMusicPlayerController systemMusicPlayer];
//提示文字        picker.prompt = NSLocalizedString(@"Select items to play", @"Select items to play");
    
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [musicArray count]+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    muiscTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.musicNameLabel.text = @"添加音乐";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.musicArtistLabel.hidden = YES;
        cell.musicImage.hidden = YES;
        [cell.musicNameLabel setFrame:CGRectMake(8, 8, 170, 28)];
    }else {
        cell.musicNameLabel.text = musicArray[indexPath.row-1 < 0 ? 0:indexPath.row-1][0];
        cell.musicArtistLabel.text = musicArray[indexPath.row-1 < 0 ? 0:indexPath.row-1][1];
        cell.musicImage.image = musicArray[indexPath.row-1 < 0 ? 0:indexPath.row-1][2];
    }
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

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

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self presentViewController:picker animated:YES completion:nil];
    }else {
        [musicPlayer play];
    }

    [tableView deselectRowAtIndexPath:indexPath animated:YES]; //
}

#pragma mark - MPMediaPickerControllerDelegate

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
    
    NSArray * items = mediaItemCollection.items;
    for (int i = 0; i<[items count]; i++) {
        MPMediaItem * item = [items objectAtIndex:i];
        
        NSString * name = [item valueForProperty:MPMediaItemPropertyTitle];
        NSString * Artist = [item valueForProperty:MPMediaItemPropertyArtist];
        NSNumber * ID = [item valueForProperty:MPMediaItemPropertyPersistentID];
        MPMediaItemArtwork * artwork = [item valueForProperty:MPMediaItemPropertyArtwork];
        UIImage *image = [artwork imageWithSize:CGSizeMake(40, 40)];
        if (!image) {
            image = [UIImage imageNamed:@"qwe.jpg"];
        }
        NSMutableArray * array = [[NSMutableArray alloc]init];
        [array addObject:name];
        [array addObject:Artist];
        [array addObject:image];
        [musicDictionary setObject:array forKey:ID];

        NSLog(@"111%@222%@333%@",name,Artist,musicDictionary);
    }
    musicArray =[musicDictionary allValues];
    [self.tableView reloadData]; //不reload，会出错～
    
    [Items shareItems].musicItemCollection = mediaItemCollection;
    
    [musicPlayer setQueueWithItemCollection:mediaItemCollection];
    
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
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
