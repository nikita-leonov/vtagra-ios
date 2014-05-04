#import "RFWebServiceClient.h"
#import "VTTag.h"
#import "VTTagLocation.h"
#import "VTVideo.h"
#import "VTWebService.h"
#import <ROAD/ROADWebservice.h>
 
@interface VTWebService(RFAttribute)
 
@end
 
@implementation VTWebService(RFAttribute)
 
#pragma mark - Fill Attributes generated code (Methods section)

+ (NSArray *)RF_attributes_VTWebService_method_tagLocationsWithNameFilter_p3 {
    NSMutableArray *RF_attributes_list_VTWebService_method_tagLocationsWithNameFilter_p3 = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL_VTWebService_method_tagLocationsWithNameFilter_p3"];
    if (RF_attributes_list_VTWebService_method_tagLocationsWithNameFilter_p3 != nil) {
        return RF_attributes_list_VTWebService_method_tagLocationsWithNameFilter_p3;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFWebServiceCall *attr1 = [[RFWebServiceCall alloc] init];
    attr1.method = @"GET";
    attr1.relativePath = @"taglocations?tagName=%%0%%";
    attr1.prototypeClass = [VTTagLocation class];
    [attributesArray addObject:attr1];

    RF_attributes_list_VTWebService_method_tagLocationsWithNameFilter_p3 = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL_VTWebService_method_tagLocationsWithNameFilter_p3"];
    
    return RF_attributes_list_VTWebService_method_tagLocationsWithNameFilter_p3;
}

+ (NSArray *)RF_attributes_VTWebService_method_tagLocationsByVideoId_p3 {
    NSMutableArray *RF_attributes_list_VTWebService_method_tagLocationsByVideoId_p3 = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL_VTWebService_method_tagLocationsByVideoId_p3"];
    if (RF_attributes_list_VTWebService_method_tagLocationsByVideoId_p3 != nil) {
        return RF_attributes_list_VTWebService_method_tagLocationsByVideoId_p3;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFWebServiceCall *attr1 = [[RFWebServiceCall alloc] init];
    attr1.method = @"GET";
    attr1.relativePath = @"taglocations?videoId=%%0%%";
    attr1.prototypeClass = [VTTagLocation class];
    [attributesArray addObject:attr1];

    RF_attributes_list_VTWebService_method_tagLocationsByVideoId_p3 = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL_VTWebService_method_tagLocationsByVideoId_p3"];
    
    return RF_attributes_list_VTWebService_method_tagLocationsByVideoId_p3;
}

+ (NSArray *)RF_attributes_VTWebService_method_videoById_p3 {
    NSMutableArray *RF_attributes_list_VTWebService_method_videoById_p3 = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL_VTWebService_method_videoById_p3"];
    if (RF_attributes_list_VTWebService_method_videoById_p3 != nil) {
        return RF_attributes_list_VTWebService_method_videoById_p3;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFWebServiceCall *attr1 = [[RFWebServiceCall alloc] init];
    attr1.method = @"GET";
    attr1.relativePath = @"video/%%0%%";
    attr1.prototypeClass = [VTVideo class];
    [attributesArray addObject:attr1];

    RF_attributes_list_VTWebService_method_videoById_p3 = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL_VTWebService_method_videoById_p3"];
    
    return RF_attributes_list_VTWebService_method_videoById_p3;
}

+ (NSMutableDictionary *)RF_attributesFactoriesForMethods {
    NSMutableDictionary *attributesVTWebServiceFactoriesForMethodsDict = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFVTWebServiceFactoriesForMethods"];
    if (attributesVTWebServiceFactoriesForMethodsDict != nil) {
        return attributesVTWebServiceFactoriesForMethodsDict;
    }
    
    NSMutableDictionary *dictionaryHolder = [super RF_attributesFactoriesForMethods];
    
    if (!dictionaryHolder) {
        dictionaryHolder = [NSMutableDictionary dictionary];
        [[RFAttributeCacheManager attributeCache] setObject:dictionaryHolder forKey:@"RFVTWebServiceFactoriesForMethods"];
    }
    
    [dictionaryHolder setObject:[self RF_invocationForSelector:@selector(RF_attributes_VTWebService_method_tagLocationsWithNameFilter_p3)] forKey:@"tagLocationsWithNameFilter:success:failure:"];
    [dictionaryHolder setObject:[self RF_invocationForSelector:@selector(RF_attributes_VTWebService_method_tagLocationsByVideoId_p3)] forKey:@"tagLocationsByVideoId:success:failure:"];
    [dictionaryHolder setObject:[self RF_invocationForSelector:@selector(RF_attributes_VTWebService_method_videoById_p3)] forKey:@"videoById:success:failure:"];
    attributesVTWebServiceFactoriesForMethodsDict = dictionaryHolder;  
    
    return attributesVTWebServiceFactoriesForMethodsDict;
}


#pragma mark - 

#pragma mark - Fill Attributes generated code (Class section)

+ (NSArray *)RF_attributesForClass {
    NSMutableArray *RF_attributes_list__class_VTWebService = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL__class_VTWebService"];
    if (RF_attributes_list__class_VTWebService != nil) {
        return RF_attributes_list__class_VTWebService;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFWebService *attr1 = [[RFWebService alloc] init];
    attr1.serviceRoot = @"http://api.vtagra.com:9000/";
    [attributesArray addObject:attr1];

    RF_attributes_list__class_VTWebService = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL__class_VTWebService"];
    
    return RF_attributes_list__class_VTWebService;
}

#pragma mark - 

@end
