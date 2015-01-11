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
#define SHOP_SEGUE_IDENTIFIER @"shopDetailSegue"


@interface WLProfileViewController ()

@end

@implementation WLProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLabels];
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setLabels
{
    self.userNameLabel.text = [NSString stringWithFormat: @"Name : %@", self.kycResponse.poi.name];
    self.userLocation.text = [NSString stringWithFormat: @"Location : %@ %@ %@", self.kycResponse.poa.house, self.kycResponse.poa.street, self.kycResponse.poa.vtc];
    [self.userImageView setImage:[self decodeBase64ToImage:self.kycResponse.photo]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_REUSE_IDENTIFIER];
    
    switch (indexPath.row) {
//        case 0:
//            cell.textLabel.text = @"Mobile";
//            cell.detailTextLabel.text = @"";
//            break;
            
        case 0:
            cell.textLabel.text = @"City";
            cell.detailTextLabel.text = self.kycResponse.poa.subdistrict;
            break;
            
        case 1:
            cell.textLabel.text = @"District";
            cell.detailTextLabel.text = self.kycResponse.poa.district;
            break;
            
            
        case 2:
            cell.textLabel.text = @"Date of Birth";
            cell.detailTextLabel.text = self.kycResponse.poi.dob;
            break;
            
        case 3:
            cell.textLabel.text = @"Gender";
            cell.detailTextLabel.text = self.kycResponse.poi.gender;
            break;
            
            
        default:
            break;
    }
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

+ (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

- (IBAction)continueButtonTouched:(id)sender {
    
    [self performSegueWithIdentifier:SHOP_SEGUE_IDENTIFIER sender:nil];
    
}

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
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
