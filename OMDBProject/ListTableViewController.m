//
//  ListTableViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "ListTableViewController.h"
#import "MovieObject.h"
#import "ListTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "UIImageView+AFNetworking.h"
#import "IndividualMovieViewController.h"



@interface ListTableViewController ()

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"movies: %@" , _movies);
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return _movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    MovieObject *movieCollection = self.movies [indexPath.row];
    [cell.posterView setImageWithURL:movieCollection.posterURL];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", movieCollection.title];
    cell.DetailsButton.tag = indexPath.row;
    [cell.DetailsButton addTarget:self action:@selector(goToIndMovie:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void) goToIndMovie:(UIButton *) sender {
    
    [self performSegueWithIdentifier: @"toIndMovie" sender: sender];
    
//    NSLog(@"Tag : %@", sender.tag);
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toIndMovie"]) {
        IndividualMovieViewController *iv;
        iv = [segue destinationViewController];
        iv.movie = self.movies[[sender tag]];
    }
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return [tableView dequeueReusableCellWithIdentifier:@"movieCell"];;
//}
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if ([_movies count]) {
//        MovieObject *movieCollection = self.movies [indexPath.row];
////        [cell addGestureRecognizer:_longPress];
//        cell.textLabel.textColor = [UIColor whiteColor];
//        cell.backgroundColor = [UIColor blackColor];
//        cell.textLabel.text = [NSString stringWithFormat:@"%@", movieCollection.title];
//
////        [cell.imageView cancelImageDownloadTask];
////        cell.imageView.image = [UIImage imageNamed:@"defaultImage"];
////        if (movieCollection.posterMovieURL) {
////            NSLog(@"%@", cell.imageView);
////            [cell.imageView setImageWithURL:movieCollection.posterMovieURL];
////
////        }
//
//    }
//    else {
//        UIAlertController *view = [UIAlertController
//                                   alertControllerWithTitle:@"Erro"
//                                   message:@"Filme não encontrado, voltar para a tela inicial."
//                                   preferredStyle:UIAlertControllerStyleActionSheet];
//        UIAlertAction* ok = [UIAlertAction
//                             actionWithTitle:@"Ok"
//                             style:UIAlertActionStyleDefault
//                             handler:^(UIAlertAction *action) {
//                                 NSArray *viewControllersFromStack = [self.navigationController viewControllers];
//                                 for(UIViewController *currentVC in [viewControllersFromStack reverseObjectEnumerator]) {
//                                     [currentVC.navigationController popViewControllerAnimated:NO];
//                                 }
//                                 [view dismissViewControllerAnimated:YES completion:^{
//                                 }];
//                             }];
//        [view addAction:ok];
//        [self presentViewController:view animated:YES completion:nil];
//    }
//
//}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
