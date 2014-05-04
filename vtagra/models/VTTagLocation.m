//
//  VTTag.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTTagLocation.h"

@implementation VTTagLocation
+ (VTTagLocation *)mock {
    VTTagLocation *result = [[VTTagLocation alloc] init];
    result.timePosition = 1+5*(CGFloat)arc4random_uniform(100)/100;
    result.x = 250+260*(CGFloat)arc4random_uniform(100)/100;
    result.y = 110+200*(CGFloat)arc4random_uniform(100)/100;
    return result;
}
@end
