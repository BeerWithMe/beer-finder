//
//  BeerViewController.h
//
//  Created by Samuel Nelson on 9/27/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerViewController : UIViewController

@property (strong, nonatomic) NSURL *imageURL;
@property (strong, nonatomic) UIImageView *beerViewImage;
@property (strong, nonatomic) NSString *breweryName;
@property (strong, nonatomic) NSString *beerABV;
@property (strong, nonatomic) NSString *breweryWebsite;
@property (strong, nonatomic) NSString *beerDescription;
@property (strong, nonatomic) NSString *beerIBU;
@property (strong, nonatomic) NSString *beerName;


@end
