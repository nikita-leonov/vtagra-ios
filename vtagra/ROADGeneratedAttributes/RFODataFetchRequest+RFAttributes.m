#import "NSSortDescriptor+RFOData.h"
#import "RFODataExpression.h"
#import "RFODataFetchRequest.h"
#import "RFODataPrioritizedPredicate.h"
#import "RFWebServiceURLBuilderParameter.h"
 
@interface RFODataFetchRequest(RFAttribute)
 
@end
 
@implementation RFODataFetchRequest(RFAttribute)
 
#pragma mark - Fill Attributes generated code (Class section)

+ (NSArray *)RF_attributesForClass {
    NSMutableArray *RF_attributes_list__class_RFODataFetchRequest = [[RFAttributeCacheManager attributeCache] objectForKey:@"RFAL__class_RFODataFetchRequest"];
    if (RF_attributes_list__class_RFODataFetchRequest != nil) {
        return RF_attributes_list__class_RFODataFetchRequest;
    }
    
    NSMutableArray *attributesArray = [NSMutableArray arrayWithCapacity:1];
    
    RFWebServiceURLBuilderParameter *attr1 = [[RFWebServiceURLBuilderParameter alloc] init];
    [attributesArray addObject:attr1];

    RF_attributes_list__class_RFODataFetchRequest = attributesArray;
    [[RFAttributeCacheManager attributeCache] setObject:attributesArray forKey:@"RFAL__class_RFODataFetchRequest"];
    
    return RF_attributes_list__class_RFODataFetchRequest;
}

#pragma mark - 

@end
