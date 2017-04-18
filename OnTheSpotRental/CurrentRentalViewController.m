//
//  CurrentRentalViewController.m
//  OnTheSpotRental
//
//  Created by Irshaad Nizrudin on 2017-03-17.
//  Copyright © 2017 Irshaad Nizrudin. All rights reserved.
//

#import "CurrentRentalViewController.h"
#import "SiteCell.h"

@interface CurrentRentalViewController ()

@end

@implementation CurrentRentalViewController

@synthesize mainDelegate, tbView;


#pragma mark Table Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mainDelegate.rents count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

// Method isnt being called. Can't figure it out.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell1";
    
    SiteCell *cell = (SiteCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[SiteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = indexPath.row;
    RentedInfo *rents = [mainDelegate.rents objectAtIndex:row];
    
    NSString *carID = rents.car_Id;
    NSInteger cID = [carID intValue];
    CarInfo *car = [mainDelegate.cars objectAtIndex:cID];
    
    cell.primaryLabel.text = car.make;
    cell.secondaryLabel.text = car.model;
    cell.myImageView.image = [UIImage imageNamed:car.picture];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    NSInteger cID = row + 1;
    
    CarInfo *carInfo = [mainDelegate.cars objectAtIndex:row];
    
    NSLog(@"ROW %ld", (long)cID);
    NSString *picture = carInfo.picture;
    NSLog(@"%@", picture);
    NSString *make = carInfo.make;
    NSString *model = carInfo.model;
    NSString *mpg = carInfo.mpg;
    NSString *cost = carInfo.cost;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CarDetailViewController *carVC = (CarDetailViewController *)[storyboard instantiateViewControllerWithIdentifier:@"2"];
    carVC.picture = picture;
    carVC.make = make;
    carVC.model = model;
    carVC.cost = cost;
    carVC.mpg = mpg;
    carVC.user_ID = mainDelegate.client_id;
    carVC.car_ID = [@(cID) stringValue];;
    
    [self presentViewController:carVC animated:YES completion:nil];
}*/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate readDataFromCarInfo];
    [mainDelegate readDataFromRentedInfo];
    [self.tbView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
