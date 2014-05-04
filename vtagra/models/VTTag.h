//
//  VTTagInfo.h
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ROAD/RFSerializable.h>

RF_ATTRIBUTE(RFSerializable)
@interface VTTag : NSObject
@property(nonatomic, copy) NSString *name;
+ (VTTag *)mock;
@end