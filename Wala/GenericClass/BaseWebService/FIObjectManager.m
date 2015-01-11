//
//  FIObjectManager.m
//  mCAS-FI
//
//  Created by amit.swami on 04/09/14.
//  Copyright (c) 2014 Nucleus. All rights reserved.
//

#import "FIObjectManager.h"
#import <RestKit/RestKit.h>
#import "Constant.h"

@implementation FIObjectManager


+ (instancetype)sharedManager {
    NSURL *baseURL = [NSURL URLWithString:BASE_URL];
    
    FIObjectManager *sharedManager  = [self managerWithBaseURL:baseURL];
    sharedManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    //RKLogConfigureByName("RestKit", RKLogLevelWarning);
    //RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    /*
     THIS CLASS IS MAIN POINT FOR CUSTOMIZATION:
     - setup HTTP headers that should exist on all HTTP Requests
     - override methods in this class to change default behavior for all HTTP Requests
     - define methods that should be available across all object managers
     */
    
    [sharedManager.HTTPClient setDefaultHeader:@"Content-Type" value:@"application/json"];
    [sharedManager setupRequestDescriptors];
    [sharedManager setupResponseDescriptors];
    
    return sharedManager;
}

- (void) setupRequestDescriptors {
}

- (void) setupResponseDescriptors {
}

@end
