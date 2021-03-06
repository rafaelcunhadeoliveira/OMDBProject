//
//  IndividualMovieViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 15/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "IndividualMovieViewController.h"


@interface IndividualMovieViewController ()

@end

@implementation IndividualMovieViewController

- (void)viewDidLoad {
    _loading.hidden = NO;
    [_loading startAnimating];
    [super viewDidLoad];
    [self Connect];
    self.navigationController.navigationBar.hidden=NO;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) Connect {
    
    NSString *link = [NSString stringWithFormat:@"https://www.omdbapi.com/?i=%@&y=&plot=short&r=json", _movie.imdbID];
    NSURL *URL = [NSURL URLWithString:link];
    
    AFHTTPSessionManager *managerHTTP = [AFHTTPSessionManager manager];
    [managerHTTP.requestSerializer setTimeoutInterval:15];
    [managerHTTP GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        _movieDetail = [[MovieObject alloc] initWithData:responseObject];
        _nameField.text = [NSString stringWithFormat:@"%@ (%@)", _movieDetail.title, _movieDetail.year];
        [_posterImageView setImageWithURL:_movieDetail.posterurl];
        _descriptionField.text = _movieDetail.plot;
        [_loading stopAnimating];
        _loading.hidesWhenStopped = TRUE;
        
    } failure:^(NSURLSessionTask* operation, NSError* error) {
        NSLog(@"Error: %@", error);
    }];

    

    
    
    
}

- (IBAction)saveButton:(id)sender {

    if([[saveIntoCoreData defaultService] Verify:_movieDetail.imdbID]){
        UIAlertController * view=   [UIAlertController
                                     alertControllerWithTitle:@""
                                     message:@"Movie already saved"
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
    else{
        if([[saveIntoCoreData defaultService] Save: _movieDetail]){
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@""
                                         message:@"The Movie has been saved"
                                         preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleCancel
                                 handler:^(UIAlertAction * action) {
//                                     NSArray *viewControllersFromStack = [self.navigationController viewControllers];
//                                     for(UIViewController *currentVC in [viewControllersFromStack reverseObjectEnumerator]) {
//                                         [currentVC.navigationController popViewControllerAnimated:NO];
//                                     }
                                     [self performSegueWithIdentifier: @"goToHome" sender: self];
                                     [view dismissViewControllerAnimated:YES completion:^{
                                     }];
                                 }];
            [view addAction:ok];
            [self presentViewController:view animated:YES completion:nil];
            
//            goToHome
        }
    }
}


@end
