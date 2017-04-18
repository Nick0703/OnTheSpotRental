//
//  CarInfo.m
//  OnTheSpotRental
//
//  Created by Vidur Prakash on 2017-04-16.
//  Copyright © 2017 Vidur Prakash. All rights reserved.
//

#import "CarInfo.h"

@implementation CarInfo
@synthesize make, model, mpg, cost, picture;

- (id)initWithData:(NSString *)pi theMake:(NSString *)ma theModel:(NSString *)mo theMpg:(NSString *)mp theCost:(NSString *)co {
    self = [super init];
    
    if(self) {
        [self setPicture:pi];
        [self setMake:ma];
        [self setModel:mo];
        [self setMpg:mp];
        [self setCost:co];
    }
    
    return self;

}

- (id)init {
    return [self initWithData:@"No picture" theMake:@"No model" theModel:@"No make" theMpg:@"No mpg" theCost:@"0"];
}
@end
