//
//  VTServiceProvider.h
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "RFServiceProvider.h"
#import "VTWebService.h"

@interface RFServiceProvider(vtagra)
RF_ATTRIBUTE(RFService, serviceClass = [VTWebService class])
+ (VTWebService *)webService;
@end
