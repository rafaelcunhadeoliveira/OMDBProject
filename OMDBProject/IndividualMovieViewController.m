//
//  IndividualMovieViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 15/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "IndividualMovieViewController.h"
#import "MovieObject.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "UIImageView+AFNetworking.h"

@interface IndividualMovieViewController ()

@end

@implementation IndividualMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", _movie.title);
    [self Connect];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) Connect {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSString *link = [NSString stringWithFormat:@"https://www.omdbapi.com/?i=%@&y=&plot=short&r=json", _movie.imdbID];
    NSURL *URL = [NSURL URLWithString:link];
    
    
    
    AFHTTPSessionManager *managerHTTP = [AFHTTPSessionManager manager];
    [managerHTTP.requestSerializer setTimeoutInterval:15];
    [managerHTTP GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        MovieObject *movieDetail = [[MovieObject alloc] initWithData:responseObject];
        
        _nameField.text = [NSString stringWithFormat:@"%@ (%@)", movieDetail.title, movieDetail.year];;
        [_posterImageView setImageWithURL:movieDetail.posterURL];
        _runTimeField.text = movieDetail.runtimeMovie;
        _descriptionField.text = movieDetail.plotMovie;
        
    } failure:^(NSURLSessionTask* operation, NSError* error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
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
