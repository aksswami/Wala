//
//  WLRegisterViewController.h
//  Wala
//
//  Created by Tapish on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JVFloatLabeledTextField.h"

@interface WLRegisterViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet JVFloatLabeledTextField *aadhaarTextBox;

@end
