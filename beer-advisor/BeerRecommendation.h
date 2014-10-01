//
//  BeerRecommendation.h
//
//  Created by Samuel Nelson on 9/25/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeerRecommendation : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *brewery;
@property (nonatomic, strong) NSString *thumbnail;

//Designated Initializer
-(id) initWithName:(NSString *)name;
+(id) beerRecommendationWithName:(NSString *)name;

-(NSURL *) thumbnailURL;
-(NSURL *) defaultThumbnailURL;

@end
