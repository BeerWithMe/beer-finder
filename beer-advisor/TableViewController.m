//
//  TableViewController.m
//
//  Created by Samuel Nelson on 9/25/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//not in here

#import "TableViewController.h"
#import "BeerRecommendation.h"
#import "BeerViewController.h"
#import "Parse.h"
#import "UIImage+ImageEffects.h"

@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.hidesBackButton = YES;
    
//    self.navigationController.view.backgroundColor =
//    [UIColor colorWithPatternImage:[UIImage imageNamed:@"restaurant"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundView = nil;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"half-pint"]];
    [imageView setFrame:self.tableView.frame];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    self.tableView.backgroundView = imageView;

    NSLog(@"username: %@", [[PFUser currentUser] username]);
//    UIImage *beerBackgroundImageSrc = [UIImage imageNamed:@"restaurant"];
//    UIImage *effectImage = [beerBackgroundImageSrc applyLightEffect];
//    self.backgroundImage.image = effectImage; //Or apply this to the effectImage.
    //This moves the table down so it doesn't go underneath the data at the top of the page.
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    self.tableView.tableHeaderView = headerView;
    
    ///////////////REFACTORED SERVER REQUEST//////////////////////////////// - need to further refactor to make asynchronous
    NSURL * url = [NSURL URLWithString:@"http://localhost:3000/temp-test"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:(@"%@", [[PFUser currentUser] username]) forHTTPHeaderField:@"x-username"];
    NSError * error = nil;
    request.HTTPMethod = @"GET";
    NSHTTPURLResponse *response = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];//This shouldn't be on the main thread.  I need to come up with a solution. Make asynchronous.
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    NSDictionary *headers = [response allHeaderFields];
    NSLog(@"%@", headers);
    if (error == nil && response.statusCode == 200) {
//        NSLog(@"%li", (long)response.statusCode);
//        NSLog(@"response message: %@", dataDictionary);
    } else {
//        NSLog(@"Error!!!!!!!!!!!!!!!!fjoasndfosaidnfaskn!!!!!!: %@", error);
    }

    self.beerRecommendations = [NSMutableArray array];
    NSArray *beerRecommendationsArray = dataDictionary[@"recommendations"];
    
    for(NSDictionary *beerRecommendationDictionary in beerRecommendationsArray) {
        BeerRecommendation *beerRecommendation = [BeerRecommendation beerRecommendationWithName:[beerRecommendationDictionary objectForKey:@"name"]];
        beerRecommendation.brewery = [beerRecommendationDictionary objectForKey:@"brewery"];
        beerRecommendation.thumbnail = [beerRecommendationDictionary objectForKey:@"imgUrl"];
        beerRecommendation.beerDescription = [beerRecommendationDictionary objectForKey:@"description"];
        beerRecommendation.abv = [beerRecommendationDictionary objectForKey:@"abv"];
        beerRecommendation.ibu = [beerRecommendationDictionary objectForKey:@"ibu"];
        beerRecommendation.url = [beerRecommendationDictionary objectForKey:@"url"];

        [self.beerRecommendations addObject:beerRecommendation];
    }
    
}

- (IBAction)logOut:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.beerRecommendations count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    BeerRecommendation *beerRecommendation = [self.beerRecommendations objectAtIndex:indexPath.row];
    
    if ([beerRecommendation.thumbnail isKindOfClass:[NSString class]]) {
    
        NSData *imageData = [NSData dataWithContentsOfURL:beerRecommendation.thumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image;

    } else {
        NSData *imageData = [NSData dataWithContentsOfURL:beerRecommendation.defaultThumbnailURL];
        UIImage *image = [UIImage imageWithData:imageData];
        cell.imageView.image = image; //This sets a default image if the server doesn't supply one.
    }
    
    cell.textLabel.text = beerRecommendation.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Brewery: %@", beerRecommendation.brewery];
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //NSLog(@"preparing for segue: %@", segue.identifier);
    
    if(([segue.identifier isEqualToString:@"showBeer"])) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BeerRecommendation *beerRecommendation = [self.beerRecommendations objectAtIndex:indexPath.row];
        NSLog(@"BEER OBJECT: %@", beerRecommendation.beerDescription);
                [segue.destinationViewController setBeerName: beerRecommendation.name];
        [segue.destinationViewController setImageURL: beerRecommendation.thumbnailURL];
        [segue.destinationViewController setBreweryName: beerRecommendation.brewery];
        [segue.destinationViewController setBeerABV: beerRecommendation.abv];
        [segue.destinationViewController setBreweryWebsite: beerRecommendation.url];
        [segue.destinationViewController setBeerDescription: beerRecommendation.beerDescription];
        [segue.destinationViewController setBeerIBU: beerRecommendation.ibu];

        
    }
    
}




@end
