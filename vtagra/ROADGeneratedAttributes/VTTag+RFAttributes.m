#import "VTTag.h"
#import <Foundation/Foundation.h>
#import <ROAD/RFSerializable.h>
 
@interface VTTag(RFAttribute)
 
@end
 
@implementation VTTag(RFAttribute)
 
#pragma mark - Fill Attributes generated code (Class section)

+ (NSArray *)RF_attributesForClass {
    NSMutableArray *RF_attributes_list__class_VTTag = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL__class_VTTag"];
    if (RF_attributes_list__class_VTTag != nil) {
        return RF_attributes_list__class_VTTag;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFSerializable *attr1 = [[RFSerializable alloc] init];
    [attributesArray addObject:attr1];

    RF_attributes_list__class_VTTag = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL__class_VTTag"];
    
    return RF_attributes_list__class_VTTag;
}

#pragma mark - 

@end
