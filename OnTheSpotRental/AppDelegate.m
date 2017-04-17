//
//  AppDelegate.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "AppDelegate.h"
#import <sqlite3.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark Database Methods
@synthesize databaseName, databasePath, cars, logins, customers;

#pragma mark Database Methods
- (void)checkAndCreateDatabase {
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    if(success)
        return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
    
    return;
}

- (void)readDataFromCarInfo {
    [self.cars removeAllObjects];
    
    sqlite3 *database;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        char *sqlStatement = "select * from carInfo;";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                char *pi = (char *)sqlite3_column_text(compiledStatement, 1); // picture
                char *ma = (char *)sqlite3_column_text(compiledStatement, 2); // make
                char *mo = (char *)sqlite3_column_text(compiledStatement, 3); // model
                char *mp = (char *)sqlite3_column_text(compiledStatement, 4); // mpg
                char *co = (char *)sqlite3_column_text(compiledStatement, 5); // cost
                
                NSString *picture = [NSString stringWithUTF8String:pi];
                NSString *make = [NSString stringWithUTF8String:ma];
                NSString *model = [NSString stringWithUTF8String:mo];
                NSString *mpg = [NSString stringWithUTF8String:mp];
                NSString *cost = [NSString stringWithUTF8String:co];

                
                CarInfo *carInfo = [[CarInfo alloc] initWithData:picture theMake:make theModel:model theMpg:mpg theCost:cost];
                [self.cars addObject:carInfo];
            }
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

- (void)readDataFromCustomerInfo {
    [self.customers removeAllObjects];
    
    sqlite3 *database;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        char *sqlStatement = "select * from customerInfo;";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                char *na = (char *)sqlite3_column_text(compiledStatement, 1);
                char *st = (char *)sqlite3_column_text(compiledStatement, 2);
                char *ci = (char *)sqlite3_column_text(compiledStatement, 3);
                char *pc = (char *)sqlite3_column_text(compiledStatement, 4);
                char *ph = (char *)sqlite3_column_text(compiledStatement, 5);
                char *py = (char *)sqlite3_column_text(compiledStatement, 6);
                char *cn = (char *)sqlite3_column_text(compiledStatement, 7);
                char *co = (char *)sqlite3_column_text(compiledStatement, 8);
                char *cv = (char *)sqlite3_column_text(compiledStatement, 9);
                char *mm = (char *)sqlite3_column_text(compiledStatement, 10);
                char *yy = (char *)sqlite3_column_text(compiledStatement, 11);
                char *pu = (char *)sqlite3_column_text(compiledStatement, 12);
                char *pp = (char *)sqlite3_column_text(compiledStatement, 13);

                NSString *name = [NSString stringWithUTF8String:na];
                NSString *street = [NSString stringWithUTF8String:st];
                NSString *city = [NSString stringWithUTF8String:ci];
                NSString *postal = [NSString stringWithUTF8String:pc];
                NSString *phone = [NSString stringWithUTF8String:ph];
                NSString *paymentType = [NSString stringWithUTF8String:py];
                NSString *cardName = [NSString stringWithUTF8String:cn];
                NSString *cardNum = [NSString stringWithUTF8String:co];
                NSString *cardCVC = [NSString stringWithUTF8String:cv];
                NSString *cardMM = [NSString stringWithUTF8String:mm];
                NSString *cardYY = [NSString stringWithUTF8String:yy];
                NSString *paypalUser = [NSString stringWithUTF8String:pu];
                NSString *paypalPass = [NSString stringWithUTF8String:pp];
                
                CustomerInfo *customerInfo = [[CustomerInfo alloc] initWithData:name theStreet:street theCity:city thePostal:postal thePhone:phone thePayment:paymentType theCardName:cardName theCardNum:cardNum theCardCVC:cardCVC theCardMM:cardMM theCardYY:cardYY thePaypalU:paypalUser thePayPalP:paypalPass];
                
                [self.customers addObject:customerInfo];
            }
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

- (NSString *)readDataFromCustomerInfoID:(NSString *)name thePhone:(NSString *)phone {
    [self.logins removeAllObjects];
    
    sqlite3 *database;
    BOOL returnCode = NO;
    NSString *user_id;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        
        NSString *querySelect = [NSString stringWithFormat:@"select * from customerInfo where name='%@' and phone_no='%@';", name, phone];
        const char *sqlStatement = [querySelect UTF8String];
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                char *ui = (char *)sqlite3_column_text(compiledStatement, 0);
                
                NSString *user_id = [NSString stringWithUTF8String:ui];
            }
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    return user_id;
}


// This is causing the app to crash....
- (BOOL)insertIntoCustomerInfo:(CustomerInfo *)customer {
    sqlite3 *database;
    BOOL returnCode = YES;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "insert into customerInfo values(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(compiledStatement, 1, [customer.name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [customer.street UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [customer.city UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 4, [customer.postal_code UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 5, [customer.phone_number UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 6, [customer.payment_type UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 7, [customer.card_name UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 8, [customer.card_number UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 9, [customer.card_cvc UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 10, [customer.card_expmm UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 11, [customer.card_expyy UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 12, [customer.paypal_user UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 13, [customer.paypal_pass UTF8String], -1, SQLITE_TRANSIENT);
        }
        
        if(sqlite3_step(compiledStatement) != SQLITE_DONE)
        {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
            returnCode = NO;
        }
        else
        {
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    
    sqlite3_close(database);
    return returnCode;
}

- (BOOL)insertIntoLoginInfo:(LoginInfo *)login {
    sqlite3 *database;
    BOOL returnCode = YES;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "insert into customerInfo values(NULL, ?, ?, ?);";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            sqlite3_bind_text(compiledStatement, 1, [login.username UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 2, [login.password UTF8String], -1, SQLITE_TRANSIENT);
            sqlite3_bind_text(compiledStatement, 3, [login.customerID UTF8String], -1, SQLITE_TRANSIENT);
        }
        
        if(sqlite3_step(compiledStatement) != SQLITE_DONE)
        {
            NSLog(@"Error: %s", sqlite3_errmsg(database));
            returnCode = NO;
        }
        else
        {
            NSLog(@"Insert into row id = %lld", sqlite3_last_insert_rowid(database));
        }
        sqlite3_finalize(compiledStatement);
    }
    
    sqlite3_close(database);
    return returnCode;
}

- (BOOL)readDataFromLoginInfo:(NSString *)username thePassword:(NSString *)password {
    [self.logins removeAllObjects];
    
    sqlite3 *database;
    BOOL returnCode = NO;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        
        NSString *querySelect = [NSString stringWithFormat:@"select * from loginInfo where username='%@' and password='%@';", username, password];
        const char *sqlStatement = [querySelect UTF8String];
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                returnCode = YES;
                char *un = (char *)sqlite3_column_text(compiledStatement, 1);
                char *pp = (char *)sqlite3_column_text(compiledStatement, 2);
                char *ui = (char *)sqlite3_column_text(compiledStatement, 3);
                
                NSString *username = [NSString stringWithUTF8String:un];
                NSString *password = [NSString stringWithUTF8String:pp];
                NSString *user_id = [NSString stringWithUTF8String:ui];
                
                LoginInfo *loginInfo = [[LoginInfo alloc] initWithData:username thePassword:password theCustomer:user_id];
                [self.logins addObject:loginInfo];
            }
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
    return returnCode;
}


#pragma mark App Methods
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.cars = [[NSMutableArray alloc] init];
    self.databaseName = @"FinalProjectDatabase.db";
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    self.databasePath = [documentsDir stringByAppendingPathComponent:self.databaseName];
    
    [self checkAndCreateDatabase];
    //[self readDataFromCarInfo];
    //[self readDataFromCustomerInfo];
    //[self readDataFromLoginInfo:@"username" thePassword:@"sheridan"];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
