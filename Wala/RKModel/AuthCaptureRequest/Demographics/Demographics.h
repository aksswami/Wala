//
//  Demographics.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

#import "Name.h"
#import "DOB.h"
#import "AddressFreetext.h"
#import "AddressStructured.h"

@interface Demographics : NSObject

@property (nonatomic, strong) NSString * age;
@property (nonatomic, strong) NSString * phone;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * gender;
@property (nonatomic, strong) NSString * addressFormat;

@property (nonatomic, strong) Name * name;
@property (nonatomic, strong) DOB * dob;
@property (nonatomic, strong) AddressFreetext * addressFreetext;
@property (nonatomic, strong) AddressStructured * addressStructured;

+ (RKObjectMapping *) demographicMappingResponse;
+ (RKObjectMapping *) demographicMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end
