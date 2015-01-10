//
//  WLProfileViewController.m
//  Wala
//
//  Created by Tapish on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "WLProfileViewController.h"
#import <QuartzCore/QuartzCore.h>

#define CELL_REUSE_IDENTIFIER @"profileViewTableViewCell"

@interface WLProfileViewController ()

@end

@implementation WLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSE_IDENTIFIER];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Mobile";
            cell.detailTextLabel.text = @"";
            break;
            
        case 1:
            cell.textLabel.text = @"Address";
            cell.detailTextLabel.text = @"";
            break;
            
        case 2:
            cell.textLabel.text = @"City";
            cell.detailTextLabel.text = @"";
            break;
            
        case 3:
            cell.textLabel.text = @"Date of Birth";
            cell.detailTextLabel.text = @"";
            break;
            
        case 4:
            cell.textLabel.text = @"Gender";
            cell.detailTextLabel.text = @"";
            break;
            
            
        default:
            break;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (IBAction)continueButtonTouched:(id)sender {
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
