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
@synthesize databaseName, databasePath, people;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.people = [NSMutableArray array];
    self.databaseName = @"FinalProjectDatabase.db";
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    
    self.databasePath = [documentsDir stringByAppendingPathComponent:self.databaseName];
    
    [self checkAndCreateDatabase];
    [self readDataFromDatabase];
    
    return YES;
}

-(void)readDataFromDatabase
{
    [self.people removeAllObjects];
    
    sqlite3 *database;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK)
    {
        char *sqlStatement = "select * from entries;";
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK);
        {
            while(sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                char *n = (char *)sqlite3_column_text(compiledStatement, 1);
                NSString *name = [NSString stringWithUTF8String:n];
                
                char *e = (char *)sqlite3_column_text(compiledStatement, 2);
                NSString *email = [NSString stringWithUTF8String:e];
                
                char *f = (char *)sqlite3_column_text(compiledStatement, 3);
                NSString *food = [NSString stringWithUTF8String:f];
                
                //Data *data = [[Data alloc] initWithData:name theEmail:email theFood:food];
                //[self.people addObject:data];
            }
        }
        sqlite3_finalize(compiledStatement);
    }
    sqlite3_close(database);
}

-(void)checkAndCreateDatabase
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    if(success) return;
    
    NSString *databasePathFromApp = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.databaseName];
    
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
    
    return;
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
