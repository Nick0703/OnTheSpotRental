//
//  AppDelegate.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInfo.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *cars;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *cars;

- (void)checkAndCreateDatabase;
- (void)readDataFromCarInfo;
//- (BOOL)insertIntoDatase:(CarInfo *)car;

@end

