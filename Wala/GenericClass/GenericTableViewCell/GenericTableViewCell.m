//
//  GenericTableViewCell.m
//  mCAS-FI
//
//  Created by amit.swami on 23/10/14.
//  Copyright (c) 2014 Nucleus. All rights reserved.
//

#import "GenericTableViewCell.h"

@implementation GenericTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIViewController *)getViewController {
    UIResponder *nextResponderView = [self nextResponder];
    while (![nextResponderView isKindOfClass:[UIViewController class]]) {
        nextResponderView = [nextResponderView nextResponder];
        if (nil == nextResponderView) {
            break;
        }
    }
    return (UIViewController *)nextResponderView;
}

@end
