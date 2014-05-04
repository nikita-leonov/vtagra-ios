//
//  VTTagPlayerViewController.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTTagPlayerViewController.h"
#import "VTTagControl.h"
#import "RFServiceProvider+vtagra.h"
#import "VTWebService.h"
#import "VTTagLocation.h"
#import "REFrostedViewController.h"
#import "VTRootViewController.h"

@interface VTTagPlayerViewController()
@property (nonatomic, copy) NSArray *tagLocations;
@property (nonatomic, assign) NSInteger lastTagIndex;

@property (nonatomic, strong) IBOutlet UILabel *timing;
@property (nonatomic, strong) NSTimer *pollTimer;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;
@end

@implementation VTTagPlayerViewController

- (void)setVideoId:(NSString *)videoId {
    VTWebService *webService = [RFServiceProvider webService];
    [webService tagLocationsByVideoId:videoId success:^(NSArray *results) {
        [self setTags:results];
    } failure:^(NSError *error) {
        NSLog(@"unable to laod tagLocations for videoId %@", videoId);
        NSLog(@"%@", error);
    }];
}

- (void)setTags:(NSArray *)tags {
    _tagLocations = [tags copy];
    _tagLocations = [_tagLocations sortedArrayUsingComparator:^NSComparisonResult(VTTagLocation *tag1, VTTagLocation *tag2) {
        if (tag1.timePosition < tag2.timePosition) {
            return NSOrderedAscending;
        } else if (tag1.timePosition > tag2.timePosition) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    self.lastTagIndex = -1;
}

- (NSArray *)popTagsForTimePosition:(CGFloat)timePosition {
    NSMutableArray *result = nil;

    for (NSInteger tagIndex = self.lastTagIndex + 1; tagIndex < self.tagLocations.count; tagIndex++)
    {
        VTTagLocation *tag = self.tagLocations[tagIndex];
        if (tag && tag.timePosition < timePosition) {
            if (result == nil) {
                result = [[NSMutableArray alloc] init];
            }
            [result addObject:tag];
            self.lastTagIndex = tagIndex;
        } else {
            break;
        }
    }
    
    return result;
}

- (void)viewDidLoad {
    self.moviePlayer = [[MPMoviePlayerController alloc] init];
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;

    UIView *movieView = self.moviePlayer.view;
    movieView.userInteractionEnabled = YES;
    
    UISwipeGestureRecognizer *swipeMenu = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognized:)];
    swipeMenu.direction = UISwipeGestureRecognizerDirectionLeft;
    [movieView addGestureRecognizer:swipeMenu];

    UISwipeGestureRecognizer *swipeBack = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureBack:)];
    swipeBack.direction = UISwipeGestureRecognizerDirectionRight;
    [movieView addGestureRecognizer:swipeBack];

    movieView.frame = self.view.frame;
    [movieView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    [self.view addSubview:movieView];
//    [self.view bringSubviewToFront:self.timing];
}

- (void)swipeGestureRecognized:(UISwipeGestureRecognizer *)sender {
    VTRootViewController *rootViewController = (VTRootViewController *)self.frostedViewController;
    [rootViewController presentMenuViewController];
}

- (void)swipeGestureBack:(UIPanGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    self.moviePlayer.contentURL = [[NSBundle mainBundle] URLForResource:@"trailer" withExtension:@"mov"];
}

- (void)viewDidAppear:(BOOL)animated {
    [self beginPlayerPolling];
    [self.moviePlayer play];
}

- (void)beginPlayerPolling {
    self.pollTimer = [NSTimer scheduledTimerWithTimeInterval:0.1                                                            target:self selector:@selector(pollTimerTick:)                                                          userInfo:nil repeats:YES];
}

- (void)pollTimerTick:(NSObject *)sender {
    if (self.moviePlayer.playbackState == MPMoviePlaybackStatePlaying) {
        NSArray *tagsToShow = [self popTagsForTimePosition:self.moviePlayer.currentPlaybackTime];
        for (VTTagLocation *tagLocation in tagsToShow) {
            UIView *tagView = [[VTTagControl alloc] initWithVTTagLocation:tagLocation forScreenSize:self.view.frame.size];
            [self.view addSubview:tagView];
        };
        self.timing.text = [NSString stringWithFormat:@"%f",self.moviePlayer.currentPlaybackTime];
        
    }
}

- (void)endPlayerPolling {
    if (self.pollTimer != nil)
    {
        [self.pollTimer invalidate];
        self.pollTimer = nil;
    }
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

@end
