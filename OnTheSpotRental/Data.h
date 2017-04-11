//
//  Data.h
//  OnTheSpotRental
//
//  Created by Xcode User on 2017-04-11.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject
{
    NSString *make;
    NSString *model;
    NSString *colour;
}
@property (strong, nonatomic) NSString *make;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *colour;
-(id)initWithData:(NSString *)m theModel:(NSString *)mo theColour:(NSString *)c;

@end
