//
//  UIViewController+FIBaseViewController.h
//  mCAS-FI
//
//  Created by amit.swami on 20/11/14.
//  Copyright (c) 2014 Nucleus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (FIBaseViewController)
- (void) failureAlertCheckWithError:(NSError *) error;

@end
