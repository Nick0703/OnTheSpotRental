//
//  CarInfo.h
//  OnTheSpotRental
//
//  Created by Vidur Prakash on 2017-04-16.
//  Copyright © 2017 Vidur Prakash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarInfo : NSObject {
    NSString *picture;
    NSString *make;
    NSString *model;
    NSString *mpg;
    NSString *cost;
}

@property (strong, nonatomic) NSString *picture;
@property (strong, nonatomic) NSString *make;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *mpg;
@property (strong, nonatomic) NSString *cost;

- (id)initWithData:(NSString *)pi theMake:(NSString *)ma theModel:(NSString *)mo theMpg:(NSString *)mp theCost:(NSString *)co;

@end
