//
//  TableViewController.m
//
//  Created by Samuel Nelson on 9/25/14.
//  Copyright (c) 2014 Treehouse. All rights reserved.
//

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
    
    //SERVER REQUEST
    NSURL *beerQuestionnaireURL = [NSURL URLWithString:@"http://localhost:3000/IOSrecommendations"];
    //Possibly shift this to a POST request.
    NSLog(@"worked");
    NSData *jsonData = [NSData dataWithContentsOfURL:beerQuestionnaireURL];
    NSError *error = nil;
    
    NSLog(@"\n jsonData %@\n", jsonData);
    NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
//    NSLog(@"\n DATADICTIONARY %@\n",dataDictionary);
    //THIS IS SUPER VALUABLE.  THIS IS HOW TO MAKE A GET REQUEST TO A SERVER.

    self.beerRecommendations = [NSMutableArray array];
    NSArray *beerRecommendationsArray = dataDictionary[@"posts"];
    
    for(NSDictionary *beerRecommendationDictionary in beerRecommendationsArray) {
        BeerRecommendation *beerRecommendation = [BeerRecommendation beerRecommendationWithName:[beerRecommendationDictionary objectForKey:@"name"]];
        beerRecommendation.brewery = [beerRecommendationDictionary objectForKey:@"brewery"];
        beerRecommendation.thumbnail = [beerRecommendationDictionary objectForKey:@"imgUrl"];

        [self.beerRecommendations addObject:beerRecommendation];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSLog(@"preparing for segue: %@", segue.identifier);
    
    if(([segue.identifier isEqualToString:@"showBeer"])) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        BeerRecommendation *beerRecommendation = [self.beerRecommendations objectAtIndex:indexPath.row];

        [segue.destinationViewController setImageURL: beerRecommendation.thumbnailURL];
    }
    
}



@end
