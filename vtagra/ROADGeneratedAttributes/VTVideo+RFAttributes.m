#import "VTVideo.h"
#import <Foundation/Foundation.h>
#import <ROAD/ROADSerialization.h>
 
@interface VTVideo(RFAttribute)
 
@end
 
@implementation VTVideo(RFAttribute)
 
#pragma mark - Fill Attributes generated code (Properties section)

+ (NSArray *)RF_attributes_VTVideo_property_videoId {
    NSMutableArray *RF_attributes_list_VTVideo_property_videoId = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL_VTVideo_property_videoId"];
    if (RF_attributes_list_VTVideo_property_videoId != nil) {
        return RF_attributes_list_VTVideo_property_videoId;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFSerializable *attr1 = [[RFSerializable alloc] init];
    attr1.serializationKey = @"id";
    [attributesArray addObject:attr1];

    RF_attributes_list_VTVideo_property_videoId = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL_VTVideo_property_videoId"];
    
    return RF_attributes_list_VTVideo_property_videoId;
}

+ (NSMutableDictionary *)RF_attributesFactoriesForProperties {
    NSMutableDictionary *attributesVTVideoFactoriesForPropertiesDict = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFVTVideoFactoriesForProperties"];
    if (attributesVTVideoFactoriesForPropertiesDict != nil) {
        return attributesVTVideoFactoriesForPropertiesDict;
    }
    
    NSMutableDictionary *dictionaryHolder = [super RF_attributesFactoriesForProperties];
    
    if (!dictionaryHolder) {
        dictionaryHolder = [NSMutableDictionary dictionary];
        [[RFAttributeCacheManager attributeCache] setObject:dictionaryHolder forKey:@"RFVTVideoFactoriesForProperties"];
    }
    
    [dictionaryHolder setObject:[self RF_invocationForSelector:@selector(RF_attributes_VTVideo_property_videoId)] forKey:@"videoId"];
    attributesVTVideoFactoriesForPropertiesDict = dictionaryHolder;  
    
    return attributesVTVideoFactoriesForPropertiesDict;
}


#pragma mark - 

#pragma mark - Fill Attributes generated code (Class section)

+ (NSArray *)RF_attributesForClass {
    NSMutableArray *RF_attributes_list__class_VTVideo = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL__class_VTVideo"];
    if (RF_attributes_list__class_VTVideo != nil) {
        return RF_attributes_list__class_VTVideo;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFSerializable *attr1 = [[RFSerializable alloc] init];
    [attributesArray addObject:attr1];

    RF_attributes_list__class_VTVideo = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL__class_VTVideo"];
    
    return RF_attributes_list__class_VTVideo;
}

#pragma mark - 

@end
