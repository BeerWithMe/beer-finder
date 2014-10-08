//
//  BeerViewController.h
//
//  Created by Samuel Nelson on 9/27/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeerViewController : UIViewController

@property (strong, nonatomic) NSURL *imageURL;
@property (strong, nonatomic) IBOutlet UIImageView *beerViewImage;
@property (weak, nonatomic) IBOutlet UILabel *breweryName;
@property (weak, nonatomic) IBOutlet UILabel *beerABV;
@property (weak, nonatomic) IBOutlet UILabel *breweryWebsite;
@property (weak, nonatomic) IBOutlet UILabel *beerDescription;
@property (weak, nonatomic) IBOutlet UILabel *beerIBU;


@end
