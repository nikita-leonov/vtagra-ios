//
//  VTVideo.h
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ROAD/ROADSerialization.h>

RF_ATTRIBUTE(RFSerializable)
@interface VTVideo : NSObject
RF_ATTRIBUTE(RFSerializable, serializationKey = @"id")
@property(nonatomic, strong) NSString *videoId;
@property(nonatomic, strong) NSString *url;
@end
