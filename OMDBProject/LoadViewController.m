//
//  LoadViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 01/03/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "LoadViewController.h"

@interface LoadViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityInd;


@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)on:(id)sender {
    [_activityInd startAnimating];
}

- (IBAction)off:(id)sender {
    [_activityInd stopAnimating];
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
