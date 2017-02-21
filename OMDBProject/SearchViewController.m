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

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)SearchButton:(id)sender {
    _movieName = movieNameField.text;
    if(_movieName.length > 2){
        [self Connect];
    }
    else{
        UIAlertController * view=   [UIAlertController
                                     alertControllerWithTitle:@"Incorrect search."
                                     message:@"Search should have at least 3 wordss."
                                     preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action) {
                                 [view dismissViewControllerAnimated:YES completion:^{
                                 }];
                             }];
        [view addAction:ok];
        [self presentViewController:view animated:YES completion:nil];
    }
}

- (IBAction)LoadButton:(id)sender {
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ListSearch"]) {
        ListTableViewController *lt;
        lt = [segue destinationViewController];
        lt.movieName = self.movieName;
    }
}

@end
