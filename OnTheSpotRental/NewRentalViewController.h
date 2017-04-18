//
//  NewRentalViewController.h
//  OnTheSpotRental
//
//  Created by Vidur Prakash on 2017-03-17.
//  Copyright © 2017 Vidur Prakash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NewRentalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate *mainDelegate;
    IBOutlet UITableView *tbView;
}

@property (strong, nonatomic) AppDelegate *mainDelegate;
@property (nonatomic, strong )IBOutlet UITableView *tbView;

@end
