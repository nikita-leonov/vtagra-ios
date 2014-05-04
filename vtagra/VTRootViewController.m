//
//  VTViewController.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTRootViewController.h"

@implementation VTRootViewController

- (void)awakeFromNib
{
    self.direction = REFrostedViewControllerDirectionRight;
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
    self.menuViewSize = (CGSize){200, 320}; //TODO: remove hardcode? :)
}

- (NSUInteger)supportedInterfaceOrientations {
    return self.contentViewController.supportedInterfaceOrientations;
}

@end
