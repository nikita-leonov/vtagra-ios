//
//  VTSearchTagsController.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTSearchTagsController.h"
#import "models/VTTag.h"
#import "RFServiceProvider+vtagra.h"
#import "VTWebService.h"
#import "VTLoadingViewCell.h"
#import "VTTagPlayerViewController.h"
#import "VTRootViewController.h"
#import "VTSearchResultCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface VTSearchTagsController()
@property(nonatomic, assign) BOOL isLoading;
@property(nonatomic, weak) id<RFWebServiceCancellable> lastCall;
@property(nonatomic, strong) NSArray *tagLocations;
@property(nonatomic, copy) NSString *videoId;
@end

@implementation VTSearchTagsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchDisplayController.searchResultsTableView.rowHeight = self.tableView.rowHeight;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    if (self.lastCall != nil) {
        [self.lastCall cancel];
        self.lastCall = nil;
    }
    
    self.isLoading = YES;
    VTWebService *webService = [RFServiceProvider webService];
    self.lastCall = [webService tagLocationsWithNameFilter:searchString success:^(NSArray *results) {
        self.tagLocations = results;
        self.isLoading = NO;
        self.lastCall = nil;
        [self.searchDisplayController.searchResultsTableView  reloadData];
    } failure:^(NSError *error) {
        self.isLoading = NO;
        self.lastCall = nil;
        [self.searchDisplayController.searchResultsTableView  reloadData];
        NSLog(@"%@", error);
    }];
    
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isLoading ? 1 : self.tagLocations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (self.isLoading) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"loading-cell"];
    } else {
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"search-result-cell"];

        VTSearchResultCell *searchResultCell = (VTSearchResultCell *)cell;
        VTTagLocation *tagLocation = (VTTagLocation *)self.tagLocations[indexPath.row];
        NSURL *thumbnailURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.vtagra.com:9000/image/%@", tagLocation.imageId]];
        [searchResultCell.thumbnail setImageWithURL:thumbnailURL];
        searchResultCell.name.text = [NSString stringWithFormat:@"#%@",tagLocation.tagName];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    VTSearchTagsController *searchTagsController =
    segue.sourceViewController;
    NSIndexPath *selectedIdexPath = searchTagsController.searchDisplayController.searchResultsTableView.indexPathForSelectedRow;
    
    VTRootViewController *rootViewController = (VTRootViewController *)segue.destinationViewController;;
    UINavigationController *navigationController = (UINavigationController *)rootViewController.contentViewController;

    VTTagPlayerViewController *tagPlayerController = (VTTagPlayerViewController *)navigationController.topViewController;
    
    [tagPlayerController setVideoId:((VTTagLocation *)self.tagLocations[selectedIdexPath.row]).videoId];
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end