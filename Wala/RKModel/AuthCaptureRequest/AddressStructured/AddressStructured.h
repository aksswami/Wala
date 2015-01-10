//
//  AddressStructured.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

@interface AddressStructured : NSObject

@property (nonatomic, strong) NSString * careOf;
@property (nonatomic, strong) NSString * house;
@property (nonatomic, strong) NSString * street;
@property (nonatomic, strong) NSString * landmark;
@property (nonatomic, strong) NSString * locality;
@property (nonatomic, strong) NSString * vtc;
@property (nonatomic, strong) NSString * subdistrict;
@property (nonatomic, strong) NSString * district;
@property (nonatomic, strong) NSString * state;
@property (nonatomic, strong) NSString * pinCode;
@property (nonatomic, strong) NSString * postOffice;



+ (RKObjectMapping *) addressStructuredMappingResponse;
+ (RKObjectMapping *) addressStructuredMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end
