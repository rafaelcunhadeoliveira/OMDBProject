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
    _actualPage = 1;
    [self Connect];
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"movieCell" forIndexPath:indexPath];
    MovieObject *movieCollection = self.movies [indexPath.row];
    [cell.posterView setImageWithURL:movieCollection.posterurl];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@", movieCollection.title];
    cell.DetailsButton.tag = indexPath.row;
    [cell.DetailsButton addTarget:self action:@selector(goToIndMovie:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (void) goToIndMovie:(UIButton *) sender {
    
    [self performSegueWithIdentifier: @"toIndMovie" sender: sender];
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toIndMovie"]) {
        IndividualMovieViewController *iv;
        iv = [segue destinationViewController];
        iv.movie = self.movies[[sender tag]];
    }
}

-(void) Connect {    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    

    
    NSString *stringDaBusca = [_movieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    NSString *link = [NSString stringWithFormat:@"https://www.omdbapi.com/?s=%@&y=&plot=short&r=json",stringDaBusca];
    NSURL *URL = [NSURL URLWithString:link];
    AFHTTPSessionManager *managerHTTP = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [managerHTTP.requestSerializer setTimeoutInterval:15];
    [managerHTTP GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSArray *jsons = [responseObject objectForKey:@"Search"];
        if(jsons.count != 0){
        NSLog(@"JSON: %@", responseObject);

            NSMutableArray *names = [NSMutableArray arrayWithCapacity:jsons.count];
            for (NSDictionary *json in jsons) {
                MovieObject *movie = [[MovieObject alloc] initWithData:json];
                [names addObject:movie];
            }
            _movies = names;
            
            
        }
    
//    NSString *stringDaBusca = [_movieName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
//    NSString *link = [NSString stringWithFormat:@"https://www.omdbapi.com/?s=%@&y=&plot=short&r=json",stringDaBusca];
//    NSURL *URL = [NSURL URLWithString:link];
//    
//    AFHTTPSessionManager *managerHTTP = [AFHTTPSessionManager manager];
//    [managerHTTP.requestSerializer setTimeoutInterval:15];
//    [managerHTTP GET:URL.absoluteString parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        NSArray *jsons = [responseObject objectForKey:@"Search"];
//        if(jsons.count != 0){
//            NSLog(@"%@", jsons);
//            NSMutableArray *names = [NSMutableArray arrayWithCapacity:jsons.count];
//            for (NSDictionary *json in jsons) {
//                MovieObject *movie = [[MovieObject alloc] initWithData:json];
//                [names addObject:movie];
//            }
//            self.movies = names;
//            
//            
//        }
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


//-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    
////    [UITextField resignFirstResponder];
//    [self Connect];
//    self.actualPage = 1;
//    // NSLog(@"\n\nfilms:%@", responseObject);
//    _films = [[NSMutableArray alloc]init];
//    NSDictionary *resultDictinary = [responseObject objectForKey:@"Search"];
//    int totalResults = [[responseObject objectForKey:@"totalResults"] intValue];
//    _totalPages = ceil(totalResults/10);
//    NSLog(@"\n%@",responseObject);
//    for (NSDictionary *filmDictionary in resultDictinary)
//    {
//        MovieObject *newFilm=[[MovieObject alloc]initWithDictionary:filmDictionary];
//        [_films addObject:newFilm];
//    }
//    if(_films.count == 0){
//        UILabel *noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mTableView.bounds.size.width, mTableView.bounds.size.height)];
//        noDataLabel.text             = @"No results";
//        noDataLabel.textColor        = [UIColor blackColor];
//        noDataLabel.textAlignment    = NSTextAlignmentCenter;
//    }else{
//        _mTableView.backgroundView = nil;
//        
//    }
//    [_mTableView reloadData];
//}
//
//
//- (void)tableView:(UITableView* )tableView willDisplayCell:(UITableViewCell* )cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSInteger lastSectionIndex = [tableView numberOfSections] - 1;
//    NSInteger lastRowIndex = [tableView numberOfRowsInSection:lastSectionIndex] - 1;
//    if ((indexPath.section == lastSectionIndex) && (indexPath.row == lastRowIndex)) {
//        self.actualPage += 1;
//        if(_actualPage<=_totalPages){
//            [self service];
//            
//        } else {
//            NSDictionary *resultDictinary = [responseObject objectForKey:@"Search"];
//            for (NSDictionary *filmDictionary in resultDictinary)
//            {
//                Film *newFilm=[[Film alloc]initWithDictionary:filmDictionary];
//                [films addObject:newFilm];
//            }
//            if(films.count == 0){
//                UILabel *noDataLabel         = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, mTableView.bounds.size.width, mTableView.bounds.size.height)];
//                noDataLabel.text             = @"No results";
//                noDataLabel.textColor        = [UIColor blackColor];
//                noDataLabel.textAlignment    = NSTextAlignmentCenter;
//                UIAlertController * alert=   [UIAlertController
//                                              alertControllerWithTitle:@"Incorrect name!"
//                                              message:@"No results."
//                                              preferredStyle:UIAlertControllerStyleAlert];
//            }
//            [_mTableView reloadData];
//        }
//    }
//failure:^(NSURLSessionTask operation, NSError error) {
//    NSLog(@"Error: %@", error);
//}];
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
