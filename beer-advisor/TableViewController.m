//
//  TableViewController.m
//
//  Created by Samuel Nelson on 9/25/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//not in here

#import "TableViewController.h"
#import "BeerRecommendation.h"
#import "BeerViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //This moves the table down so it doesn't go underneath the data at the top of the page.
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    self.tableView.tableHeaderView = headerView;
    
    ///////////////REFACTORED SERVER REQUEST//////////////////////////////// - need to further refactor to make asynchronous
    NSURL * url = [NSURL URLWithString:@"http://localhost:3000/IOSrecommendations"];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"test" forHTTPHeaderField:@"x-username"];
    NSError * error = nil;
    request.HTTPMethod = @"GET";
    NSHTTPURLResponse *response = nil;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
    
    if (error == nil && response.statusCode == 200) {
       // NSLog(@"%li", (long)response.statusCode);
        //NSLog(@"response message: %@", dataDictionary);
    } else {
        //NSLog(@"Error!!!!!!!!!!!!!!!!fjoasndfosaidnfaskn!!!!!!: %@", error);
    }

    self.beerRecommendations = [NSMutableArray array];
    NSArray *beerRecommendationsArray = dataDictionary[@"posts"];
    
    for(NSDictionary *beerRecommendationDictionary in beerRecommendationsArray) {
        BeerRecommendation *beerRecommendation = [BeerRecommendation beerRecommendationWithName:[beerRecommendationDictionary objectForKey:@"name"]];
        beerRecommendation.brewery = [beerRecommendationDictionary objectForKey:@"brewery"];
        beerRecommendation.thumbnail = [beerRecommendationDictionary objectForKey:@"imgUrl"];

        [self.beerRecommendations addObject:beerRecommendation];
    }
    
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

        [segue.destinationViewController setImageURL: beerRecommendation.thumbnailURL];
    }
    
}




@end
