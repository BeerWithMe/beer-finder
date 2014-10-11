//
//  BeerViewController.m
//
//  Created by Samuel Nelson on 9/27/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

#import "BeerViewController.h"
#import "BeerRecommendation.h"
#import "UIImage+ImageEffects.h"

@interface BeerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *beerName;

@end

@implementation BeerViewController

- (void)viewDidLoad {
    [super viewDidLoad];  //POSSIBLY OPTIMIZE THIS THROUGH CACHING IMG DATA
    //NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL];
    if ([self.imageURL isKindOfClass:[NSURL class]]) {  //Displays beer image if an image is present.
        NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        self.beerViewImage.image = image;
    } else { //If there is no beer image then it displays this default image.
        BeerRecommendation *beerRecommendation = [[BeerRecommendation alloc] init];
        NSData *imageData = [NSData dataWithContentsOfURL:beerRecommendation.defaultThumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        self.beerViewImage.image = image;
    }
    
    //UIImage *beerBackgroundImageSrc = [UIImage imageNamed:@"beer-background"];
    //UIImage *effectImage = [beerBackgroundImageSrc applyLightEffect];
    [self.backgroundImage.image applyLightEffect]; //Or apply this to the effectImage.
    //The above three lines applies the blur effect.
    
    //self.beerName.text = @"Sup dude";

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
