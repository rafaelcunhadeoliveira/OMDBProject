//
//  LoadTableViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 16/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "LoadTableViewController.h"

@interface LoadTableViewController  ()

@end

@implementation LoadTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _moviesWatched = [[saveIntoCoreData defaultService] ReturnAll];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _moviesWatched.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LoadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"LoadCell" forIndexPath:indexPath];
    [cell.posterLoadView setImageWithURL:[NSURL URLWithString: _moviesWatched[indexPath.row].poster]];
    cell.LoadNameField.text =  [NSString stringWithFormat:@"%@ (%@)", _moviesWatched[indexPath.row].title, _moviesWatched[indexPath.row].year];

    return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *movies = [self.moviesWatched mutableCopy];
        MovieObject *movie = movies[indexPath.row];
        [movies removeObject:movie];
        self.moviesWatched = movies;
        
        AppDelegate *appDelegate = (AppDelegate *) UIApplication.sharedApplication.delegate;
        NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
        [context deleteObject:movie];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationFade];

    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
     LoadIndividualViewController *lm = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"loadMovie"];
    ObjectMO *chosenmovie = self.moviesWatched [indexPath.row];
    
    lm.movie = chosenmovie;
    [self.navigationController pushViewController: lm animated:YES];
}






//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:){
//    if ([segue.identifier isEqualToString:@"loadInd"]) {
//        LoadIndividualViewController *lv;
//        lv = [segue destinationViewController];
//        lv.movie = self.moviesWatched[[sender tag]];
//    }
//}


@end
