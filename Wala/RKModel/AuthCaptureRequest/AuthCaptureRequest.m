//
//  AuthCaptureRequest.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//abcd

#import "AuthCaptureRequest.h"
#import "RKRelationshipMapping.h"

@implementation AuthCaptureRequest

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"aadhaarId" : @"aadhaar-id",
             @"modality" : @"modality",
             @"modalityType" :@"modality-type",
             @"numberOfFingersToCapture" : @"number-of-fingers-to-capture",
             @"numberOfIrisToCapture" :@"number-of-iris-to-capture",
             @"otp" : @"otp",
             @"deviceId" : @"device-id" ,
             @"certificateType" :@"certificate-type" 
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
     [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"demographics" toKeyPath:@"demographics" withMapping:[Demographics demographicMappingRequest]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"location" toKeyPath:@"location" withMapping:[Location locationMappingRequest]]];
    
    
    return mapping;
}

//OTP Mapping

+ (RKObjectMapping *) otpMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[AuthCaptureRequest class]];
    [mapping addAttributeMappingsFromDictionary:[AuthCaptureRequest elementToPropertyMappings]];
    
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) otpMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[AuthCaptureRequest elementToPropertyMappings]];
    [mapping addAttributeMappingsFromDictionary:@{@"channel" : @"channel"}];
    
    // Add some relation mappings (if any.)
    
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"location" toKeyPath:@"location" withMapping:[Location locationMappingRequest]]];
    
    
    return mapping;
}

@end
