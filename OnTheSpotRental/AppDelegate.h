//
//  AppDelegate.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarInfo.h"
#import "CustomerInfo.h"
#import "LoginInfo.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{

    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *cars;
    NSMutableArray *customers;
    NSMutableArray *logins;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *cars;
@property (strong, nonatomic) NSMutableArray *customers;
@property (strong, nonatomic) NSMutableArray *logins;

- (void)checkAndCreateDatabase;
- (void)readDataFromCarInfo;
- (void)readDataFromCustomerInfo;
- (NSString *)readDataFromCustomerInfoID:(NSString *)name thePhone:(NSString *)phone;
- (BOOL)readDataFromLoginInfo:(NSString *)username thePassword:(NSString *)password;
- (BOOL)insertIntoCustomerInfo:(CustomerInfo *)customer;
- (BOOL)insertIntoLoginInfo:(LoginInfo *)login;


@end

