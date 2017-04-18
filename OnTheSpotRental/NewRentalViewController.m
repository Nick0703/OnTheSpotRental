//
//  NewRentalViewController.m
//  OnTheSpotRental
//
//  Created by Vidur Prakash on 2017-03-17.
//  Copyright © 2017 Vidur Prakash. All rights reserved.
//

#import "NewRentalViewController.h"
#import "CarDetailViewController.h"
#import "SiteCell.h"

@interface NewRentalViewController ()

@end

@implementation NewRentalViewController
@synthesize  mainDelegate, tbView;

#pragma mark Table Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [mainDelegate.cars count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    
    SiteCell *cell = (SiteCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[SiteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSInteger row = indexPath.row;
    CarInfo *carInfo = [mainDelegate.cars objectAtIndex:row];

    cell.primaryLabel.text = carInfo.make;
    cell.secondaryLabel.text = carInfo.model;
    cell.myImageView.image = [UIImage imageNamed:carInfo.picture];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
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
}

#pragma mark App methods

- (IBAction)unwindToNewRentalController:(UIStoryboardSegue *)sender {
    
}

// Hide keyboard when touching the backgroud
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder]; // Hide the keyboard and return the control
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    [mainDelegate readDataFromCarInfo];

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
