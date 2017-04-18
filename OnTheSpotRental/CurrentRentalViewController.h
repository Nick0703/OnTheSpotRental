//
//  CurrentRentalViewController.h
//  OnTheSpotRental
//
//  Created by Irshaad Nizrudin on 2017-03-17.
//  Copyright © 2017 Irshaad Nizrudin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CurrentRentalViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    AppDelegate *mainDelegate;
    IBOutlet UITableView *tbView;
}

@property (strong, nonatomic) AppDelegate *mainDelegate;
@property (nonatomic, strong )IBOutlet UITableView *tbView;

@end
