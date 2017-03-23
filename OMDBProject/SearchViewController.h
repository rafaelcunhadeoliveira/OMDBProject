//
//  SearchViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieObject.h"
#import "LoadTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "ListTableViewController.h"

@interface SearchViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *movieNameField;
@property (weak, nonatomic) IBOutlet UIButton *SearchButton;
@property (weak, nonatomic) IBOutlet UIButton *LoadButton;
@property NSArray<MovieObject*> *movies;
@property NSArray<NSString*> *omdbId;
@property(strong, nonatomic) NSString *movieName;


- (IBAction)SearchButton:(id)sender;


@end
