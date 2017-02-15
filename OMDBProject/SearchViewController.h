//
//  SearchViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieObject.h"

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *movieNameField;
@property (weak, nonatomic) IBOutlet UIButton *SearchButton;
@property NSArray<MovieObject*> *movies;
-(void) Connect;

- (IBAction)SearchButton:(id)sender;


@end
