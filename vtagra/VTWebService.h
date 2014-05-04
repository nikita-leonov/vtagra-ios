//
//  VTWebService.h
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "RFWebServiceClient.h"
#import <ROAD/ROADWebservice.h>
#import "VTTagLocation.h"
#import "VTTag.h"
#import "VTVideo.h"

RF_ATTRIBUTE(RFWebService, serviceRoot = @"http://api.vtagra.com:9000/")
@interface VTWebService : RFWebServiceClient

RF_ATTRIBUTE(RFWebServiceCall, method = @"GET", relativePath = @"taglocations?tagName=%%0%%", prototypeClass = [VTTagLocation class])
- (id<RFWebServiceCancellable>)tagLocationsWithNameFilter:(NSString *)nameFilter success:(void(^)(NSArray *results))successBlock failure:(void(^)(NSError *error))failureBlock;

RF_ATTRIBUTE(RFWebServiceCall, method = @"GET", relativePath = @"taglocations?videoId=%%0%%", prototypeClass = [VTTagLocation class])
- (id<RFWebServiceCancellable>)tagLocationsByVideoId:(NSString *)videoId success:(void(^)(NSArray *results))successBlock failure:(void(^)(NSError *error))failureBlock;

RF_ATTRIBUTE(RFWebServiceCall, method = @"GET", relativePath = @"video/%%0%%", prototypeClass = [VTVideo class])
- (id<RFWebServiceCancellable>)videoById:(NSString *)videoId success:(void(^)(VTVideo *result))successBlock failure:(void(^)(NSError *error))failureBlock;

@end
