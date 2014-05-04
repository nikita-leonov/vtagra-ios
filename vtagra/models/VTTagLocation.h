//
//  VTTag.h
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

@import Foundation;

#import <ROAD/ROADSerialization.h>

RF_ATTRIBUTE(RFSerializable)
@interface VTTagLocation : NSObject
@property(nonatomic, assign) NSTimeInterval timePosition;
@property(nonatomic, assign) NSInteger duration;
@property(nonatomic, assign) CGFloat x;
@property(nonatomic, assign) CGFloat y;
@property(nonatomic, copy) NSString *videoId;
@property(nonatomic, copy) NSString *imageId;
@property(nonatomic, copy) NSString *tagName;
@property(nonatomic, copy) NSString *tagUrl;
@property(nonatomic, copy) NSString *tagImageId;
+ (VTTagLocation *)mock;
@end