//
//  SearchViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "SearchViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "MovieObject.h"
#import "ListTableViewController.h"

@interface SearchViewController ()
@end

@implementation SearchViewController

@synthesize movieNameField;
NSString *movieName = @"";




- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)SearchButton:(id)sender {
    movieName = movieNameField.text;
    NSLog(@"%@", movieName);
    [self Connect];
}

-(void) Connect {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *stringDaBusca = [movieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *link = [NSString stringWithFormat:@"https://www.omdbapi.com/?s=%@&y=&plot=short&r=json",stringDaBusca];
    NSURL *URL = [NSURL URLWithString:link];
    
    
    
    AFHTTPSessionManager *managerHTTP = [AFHTTPSessionManager manager];
    [managerHTTP.requestSerializer setTimeoutInterval:15];
    [managerHTTP GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSArray *jsons = [responseObject objectForKey:@"Search"];
        NSMutableArray *names = [NSMutableArray arrayWithCapacity:jsons.count];
        for (NSDictionary *json in jsons) {
            MovieObject *movie = [[MovieObject alloc] initWithData:json];
            [names addObject:movie];
            NSLog(@"%@", self.movies);
        }
        self.movies = names;
//        [[NSUserDefaults standardUserDefaults] setObject: self.movies forKey:@"k"];
//        //        [[NSUserDefaults standardUserDefaults] setObject:@"passou" forKey:@"k"];
//        [[NSUserDefaults standardUserDefaults] synchronize];

        [self performSegueWithIdentifier: @"ListSearch" sender: nil];
    } failure:^(NSURLSessionTask* operation, NSError* error) {
        NSLog(@"Error: %@", error);
    }];
    NSLog(@"%@", movieName);

    

}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ListSearch"]) {
        ListTableViewController *lt;
        lt = [segue destinationViewController];
        lt.movies = self.movies;
    }
}




@end
