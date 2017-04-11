//
//  NewRentalViewController.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-17.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface NewRentalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    AppDelegate *mainDelegate;
}
@property (strong, nonatomic) AppDelegate *mainDelegate;
@end
