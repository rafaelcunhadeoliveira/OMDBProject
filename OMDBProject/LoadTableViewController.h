//
//  LoadTableViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 16/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "saveIntoCoreData.h"
#import "LoadTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "UIImageView+AFNetworking.h"
#import "IndividualMovieViewController.h"
#import "MovieObject.h"
#import "ObjectMO.h"
#import "LoadIndividualViewController.h"


@interface LoadTableViewController : UITableViewController

@property(strong, nonatomic) NSMutableArray<ObjectMO*> *moviesWatched;


@end
