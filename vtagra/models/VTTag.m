//
//  VTTagInfo.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTTag.h"

@implementation VTTag
+ (VTTag *)mock {
    VTTag *result = [[VTTag alloc] init];
    result.name = [NSString stringWithFormat:@"tag %i", arc4random_uniform(10)];
    return result;
}
@end
