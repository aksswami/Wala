//
//  FIObjectManager.h
//  mCAS-FI
//
//  Created by amit.swami on 04/09/14.
//  Copyright (c) 2014 Nucleus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectManager.h"

@interface FIObjectManager : RKObjectManager

+ (instancetype) sharedManager;

- (void) setupRequestDescriptors;
- (void) setupResponseDescriptors;

@end
