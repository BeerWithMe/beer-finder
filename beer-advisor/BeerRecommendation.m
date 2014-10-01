//
//  BeerRecommendation.m
//
//  Created by Samuel Nelson on 9/25/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import "BeerRecommendation.h"

@implementation BeerRecommendation

-(id) initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.brewery = nil;
        self.thumbnail = nil;
    }
    return self;
}

+(id)beerRecommendationWithName:(NSString *)name {
    return [[self alloc] initWithName:name];
}

-(NSURL *) thumbnailURL {
    
    return [NSURL URLWithString:self.thumbnail];
}

-(NSURL *) defaultThumbnailURL {
    return [NSURL URLWithString:@"http://media-cache-ak0.pinimg.com/236x/51/fc/c2/51fcc250a63cb8d7b67915c87355049e.jpg"];
}


@end
