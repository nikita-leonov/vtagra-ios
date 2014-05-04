//
//  VTBrowserViewController.h
//  vtagra
//
//  Created by Nikita Leonov on 5/4/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTBrowserViewController : UIViewController
@property(nonatomic, copy) NSURL *url;
@property(nonatomic, weak) IBOutlet UIWebView *webView;
@end
