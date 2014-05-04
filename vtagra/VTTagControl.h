//
//  VTTagView.h
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kTagLocationSelected = @"kTagLocationSelected";

@class VTTagLocation;
@interface VTTagControl : UIControl
- (instancetype)initWithVTTagLocation:(VTTagLocation *)tagLocation forScreenSize:(CGSize)screenSize;
@end