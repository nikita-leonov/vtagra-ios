//
//  VTBrowserViewController.m
//  vtagra
//
//  Created by Nikita Leonov on 5/4/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTBrowserViewController.h"

@interface VTBrowserViewController ()
@end

@implementation VTBrowserViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}
@end
