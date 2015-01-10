//
//  AuthCaptureRequest.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "AuthCaptureRequest.h"

@implementation AuthCaptureRequest

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"aadhaar-id" : @"aadhaarId",
             @"modality" : @"modality",
             @"modality-type" : @"modalityType",
             @"number-of-fingers-to-capture" : @"numberOfFingersToCapture",
             @"number-of-iris-to-capture" : @"numberOfIrisToCapture",
             @"otp" : @"otp",
             @"device-id" : @"deviceId",
             @"certificate-type" : @"certificateType"
             };
}

+ (RKObjectMapping *) authCaptureRequestMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[AuthCaptureRequest class]];
    [mapping addAttributeMappingsFromDictionary:[AuthCaptureRequest elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) authCaptureRequestMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[AuthCaptureRequest elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    // [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginDetails" toKeyPath:@"loginBeanDetail" withMapping:[LoginDetails loginDetailsMappingRequest]]];
    
    return mapping;
}

@end
