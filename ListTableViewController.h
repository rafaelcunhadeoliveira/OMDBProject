//
//  ListTableViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieObject.h"
#import "ListTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "UIImageView+AFNetworking.h"
#import "IndividualMovieViewController.h"

@interface ListTableViewController : UITableViewController
@property(nonatomic) BOOL *isSomethingEnabled;
@property(strong, nonatomic) NSArray<MovieObject*> *movies;
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
@property (strong, nonatomic) NSString *movieName;
@property int *actualPage;
@property (strong, nonatomic) NSMutableArray<MovieObject* > *films;

-(void) Connect;

@end
