#import "VTTagLocation.h"
#import <ROAD/ROADSerialization.h>
 
@interface VTTagLocation(RFAttribute)
 
@end
 
@implementation VTTagLocation(RFAttribute)
 
#pragma mark - Fill Attributes generated code (Class section)

+ (NSArray *)RF_attributesForClass {
    NSMutableArray *RF_attributes_list__class_VTTagLocation = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL__class_VTTagLocation"];
    if (RF_attributes_list__class_VTTagLocation != nil) {
        return RF_attributes_list__class_VTTagLocation;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFSerializable *attr1 = [[RFSerializable alloc] init];
    [attributesArray addObject:attr1];

    RF_attributes_list__class_VTTagLocation = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL__class_VTTagLocation"];
    
    return RF_attributes_list__class_VTTagLocation;
}

#pragma mark - 

@end
