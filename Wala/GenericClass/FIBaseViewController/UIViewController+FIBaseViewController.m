//
//  UIViewController+FIBaseViewController.m
//  mCAS-FI
//
//  Created by amit.swami on 20/11/14.
//  Copyright (c) 2014 Nucleus. All rights reserved.
//

#import "UIViewController+FIBaseViewController.h"

@implementation UIViewController (FIBaseViewController)

//- (void) failureAlertCheckWithError:(NSError*) error {
//    [MRProgressOverlayView dismissOverlayForView:self.view animated:YES];
//    [[[UIAlertView alloc] initWithTitle:(error).localizedDescription
//                                message:(error).localizedFailureReason
//                       cancelButtonItem:[RIButtonItem itemWithLabel:@"Ok" action:^{
//        if((error).code == 502 || (error).code == -1009 ){
//            [FIApplicationUtils presentLoginViewController:self.navigationController];
//        }else if ((error).code == 501){
//            [self.navigationController popViewControllerAnimated:YES];
//        }
//    }]
//                       otherButtonItems: nil] show];
//    NSLog(@"Error : %@",[(error) localizedDescription]);
//}

@end
