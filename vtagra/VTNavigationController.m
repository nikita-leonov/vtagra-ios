//
//  VTNavigationController.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTNavigationController.h"
#import "REFrostedViewController.h"

@implementation VTNavigationController

- (NSUInteger)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

@end
