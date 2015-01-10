//
//  KYCResponse.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POI.h"
#import "AddressStructured.h"

@interface KYCResponse : NSObject

@property (nonatomic, strong) NSString * aadhaarId;
@property (nonatomic, strong) NSString * photo;
@property (nonatomic, strong) NSString * localData;

@property (nonatomic, strong) POI * poi;
@property (nonatomic, strong) AddressStructured * poa;

+ (RKObjectMapping *) kycResponseMappingResponse;
+ (RKObjectMapping *) kycResponseMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end
