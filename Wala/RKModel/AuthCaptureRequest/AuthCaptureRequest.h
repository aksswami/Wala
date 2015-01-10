//
//  AuthCaptureRequest.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

#import "Demographics.h"
#import "Location.h"

@interface AuthCaptureRequest : NSObject

@property (nonatomic, strong) NSString * aadhaarId;
@property (nonatomic, strong) NSString * modality;
@property (nonatomic, strong) NSString * modalityType;
@property (nonatomic, strong) NSString * numberOfFingersToCapture;
@property (nonatomic, strong) NSString * numberOfIrisToCapture;
@property (nonatomic, strong) NSString * otp;
@property (nonatomic, strong) NSString * deviceId;
@property (nonatomic, strong) NSString * certificateType;

@property (nonatomic, strong) Demographics * demographics;
@property (nonatomic, strong) Location * location;


+ (RKObjectMapping *) authCaptureRequestMappingResponse;
+ (RKObjectMapping *) authCaptureRequestMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end
