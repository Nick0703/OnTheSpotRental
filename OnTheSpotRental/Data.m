//
//  Data.m
//  OnTheSpotRental
//
//  Created by Xcode User on 2017-04-11.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "Data.h"

@implementation Data
@synthesize make, model, colour;

-(id)initWithData:(NSString *)m theModel:(NSString *)mo theColour:(NSString *)c
{
    if (self = [super init])
    {
        [self setMake:m];
        [self setModel:mo];
        [self setColour:c];
    }
    return self;
}
@end
