//
//  VTTagsTableViewController.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTTagsTableViewController.h"
#import "VTTagControl.h"
#import "VTTagViewCell.h"
#import "VTTagLocation.h"
#import "VTBrowserViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface VTTagsTableViewController ()
@property (nonatomic, strong) NSMutableArray *tagLocations;
@end

@implementation VTTagsTableViewController

- (void)awakeFromNib {
    self.tagLocations = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addTagLocation:) name:kTagLocationSelected object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)addTagLocation:(NSNotification *) notification {
    if ([notification.name isEqualToString:kTagLocationSelected]) {
        [self.tagLocations insertObject:notification.object atIndex:0];
        [self.tableView reloadData];
    }
}
     
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tagLocations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VTTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tag-cell" forIndexPath:indexPath];
    
    VTTagLocation *tagLocation = self.tagLocations[indexPath.row];
    NSURL *thumbnailURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.vtagra.com:9000/image/%@", tagLocation.tagImageId]];
    [cell.thumbnail setImageWithURL:thumbnailURL];
    cell.name.text = tagLocation.tagName;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    VTTagLocation *tagLocation = self.tagLocations[self.tableView.indexPathForSelectedRow.row];
    VTBrowserViewController *browserController = (VTBrowserViewController *)segue.destinationViewController;
    browserController.url = [NSURL URLWithString:tagLocation.tagUrl];
}

- (IBAction)done:(UIStoryboardSegue *)segue {
    
}

@end
