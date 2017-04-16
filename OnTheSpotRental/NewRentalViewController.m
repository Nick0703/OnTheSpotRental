//
//  NewRentalViewController.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-17.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "NewRentalViewController.h"
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
    
    CarInfo *carInfo = [mainDelegate.cars objectAtIndex:row];
    
    NSString *make = carInfo.make;
    NSString *msg = [NSString stringWithFormat:@"Model: %@\n Miles per gallon: %@\n"
                     @"Cost per day: %@\n", carInfo.model, carInfo.mpg, carInfo.cost];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:make message:msg preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
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
