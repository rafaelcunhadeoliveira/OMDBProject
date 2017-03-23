//
//  ListTableViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "ListTableViewController.h"




@interface ListTableViewController ()

@end

@implementation ListTableViewController



- (void)viewDidLoad {
    _load.hidden = NO;
    [_load startAnimating];
    _actualPage = 1;
    _movies = [[NSMutableArray alloc] init];
    [self Connect];
    self.navigationController.navigationBar.hidden=NO;
    [super viewDidLoad];
//    [_load stopAnimating];
//    _load.hidesWhenStopped = true;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


-(void) Connect {    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSString *stringDaBusca = [_movieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *link = [NSString stringWithFormat:@"https://www.omdbapi.com/?s=%@&y=&plot=short&r=json",stringDaBusca];
    NSURL *URL = [NSURL URLWithString:link];
    AFHTTPSessionManager *managerHTTP = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [managerHTTP.requestSerializer setTimeoutInterval:15];
    [managerHTTP GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSArray *jsons = [responseObject objectForKey:@"Search"];
        NSString * here = [responseObject objectForKey:@"totalResults"];
        _totalItens = here.intValue;
        _totalPages = (_totalItens/10) + 1;
        if(jsons.count != 0){
            NSLog(@"JSON: %@", responseObject);
            for (NSDictionary *json in jsons) {
                MovieObject *movie = [[MovieObject alloc] initWithData:json];
                [_movies addObject:movie];
            }
            [self.tableView reloadData];
        }
        
        else{
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@""
                                         message:@"No movies found"
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
    } failure:^(NSURLSessionTask* operation, NSError* error) {
        NSLog(@"Error: %@", error);
    }];
}


-(void) Pagination {    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    _actualPage += 1;
    NSString *stringDaBusca = [_movieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *link = [NSString stringWithFormat:@"https://www.omdbapi.com/?s=%@&page=%d",stringDaBusca,_actualPage];
    NSURL *URL = [NSURL URLWithString:link];
    AFHTTPSessionManager *managerHTTP = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [managerHTTP.requestSerializer setTimeoutInterval:15];
    [managerHTTP GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSArray *jsons = [responseObject objectForKey:@"Search"];
        
        if(jsons.count != 0){
            NSLog(@"JSON: %@", responseObject);
            
            for (NSDictionary *json in jsons) {
                MovieObject *movie = [[MovieObject alloc] initWithData:json];
                [_movies addObject:movie];
            }
            [self.tableView reloadData];
        }
        
        else{
            UIAlertController * view=   [UIAlertController
                                         alertControllerWithTitle:@""
                                         message:@"No movies found"
                                         preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     //                               [self performSegueWithIdentifier: @"goToHome" sender: self];
                                     [view dismissViewControllerAnimated:YES completion:^{
                                     }];
                                 }];
            [view addAction:ok];
            [self presentViewController:view animated:YES completion:nil];
        }
    } failure:^(NSURLSessionTask* operation, NSError* error) {
        NSLog(@"Error: %@", error);
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return _movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    return [tableView dequeueReusableCellWithIdentifier:@"movieCell"];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(ListTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieObject *movieCollection = self.movies [indexPath.row];
    [cell.posterView setImageWithURL:movieCollection.posterurl];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", movieCollection.title];
    cell.DetailsButton.tag = indexPath.row;
    [cell.DetailsButton addTarget:self action:@selector(goToIndMovie:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.loading stopAnimating];
//    cell.loading.hidesWhenStopped = true;
}

- (void) goToIndMovie:(UIButton *) sender {
    
    [self performSegueWithIdentifier: @"toIndMovie" sender: sender];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"Will begin dragging");
}

- (void)scrollViewDidScroll:(UIScrollView *)aScrollView
{
    CGFloat height = aScrollView.frame.size.height;
    
    CGFloat contentYoffset = aScrollView.contentOffset.y;
    
    CGFloat distanceFromBottom = aScrollView.contentSize.height - contentYoffset;
    
    if(distanceFromBottom < height)
    {   if(_actualPage < _totalPages){
        [self Pagination];
    }
    }
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toIndMovie"]) {
        IndividualMovieViewController *iv;
        iv = [segue destinationViewController];
        iv.movie = self.movies[[sender tag]];
    }
}


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
