//
//  IndividualMovieViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 15/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieObject.h"

@interface IndividualMovieViewController : UIViewController

@property(strong, nonatomic) MovieObject *movie;
@property(strong, nonatomic) NSArray<MovieObject*> *movies;
@property (weak, nonatomic) IBOutlet UILabel *runTimeField;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionField;

-(void) Connect;

@end
