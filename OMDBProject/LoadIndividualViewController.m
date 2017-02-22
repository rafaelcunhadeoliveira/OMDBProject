//
//  LoadIndividualViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 17/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "LoadIndividualViewController.h"


@interface LoadIndividualViewController ()

@end

@implementation LoadIndividualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _individualNameField.text = [NSString stringWithFormat:@"%@ (%@)", _movie.title, _movie.year];
    [_individualPosterView setImageWithURL:[NSURL URLWithString:_movie.poster] ];
    _individualDescField.text = _movie.plot;
    _individualActorsField.text = _movie.actors;
    _individualDurationField.text = _movie.runtime;
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
