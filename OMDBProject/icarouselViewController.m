#import "icarouselViewController.h"


#import "CarouselCellView.h"


@interface icarouselViewController () <iCarouselDataSource, iCarouselDelegate, UIGestureRecognizerDelegate, UICarouselCellDelegate>

@property (strong, nonatomic) IBOutlet iCarousel *carousel;
@end

@implementation icarouselViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.moviesWatched = [[saveIntoCoreData defaultService] ReturnAll];
    [self CustomButton];
    self.navigationController.navigationBar.hidden=YES;
    self.carousel.type = iCarouselTypeCoverFlow2;
    self.count = 0;
    self.searchTextField.delegate = self;
//    _hideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//    [self.view addGestureRecognizer:_hideKeyboard];
    self.carousel.dataSource = self;
    self.carousel.delegate = self;
    [self viewWillAppear:YES];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}

//-(void) handleSingleTap: (UITapGestureRecognizer *) recognizer{
////    [self.view endEditing:YES];
//    [_searchTextField resignFirstResponder];
//}

-(void)CustomButton{
    [self.searchButton setImage:[UIImage imageNamed:@"lupa.png"] forState:UIControlStateNormal];
    self.searchButton.adjustsImageWhenHighlighted = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - iCarouselDataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return _moviesWatched.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    CarouselCellView *cellView = [CarouselCellView instanceFromXIB];
    //    cellview.titleLabel.text
    cellView.frame = CGRectMake(0, 0, carousel.bounds.size.width * 0.9, carousel.bounds.size.height * 0.7);
    //    CGFloat r = (arc4random() % 255)/255.0;
    //    CGFloat g = (arc4random() % 255)/255.0;
    //    CGFloat b = (arc4random() % 255)/255.0;
    //    cellView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    //cellView.backgroundColor = [UIColor whiteColor ];
    cellView.tittleLabel.text = _moviesWatched[index].title;
    [cellView.posterView setImageWithURL:[NSURL URLWithString: _moviesWatched[index].poster]];
    cellView.delegate = self;
    cellView.index = _moviesWatched[index].imdbID;
//    [carousel reloadData];
    
    return cellView;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [self buttonAction];
    return true;
}

- (IBAction)search:(id)sender {
    [self buttonAction];
    
}

-(void) buttonAction{
    _movieName = _searchTextField.text;
    _searchTextField.text = @"";
    
    if(_movieName.length > 2){
        [self performSegueWithIdentifier: @"ListSearch" sender: nil];
    }
    else{
        UIAlertController * view=   [UIAlertController
                                     alertControllerWithTitle:@"Incorrect search."
                                     message:@"Search should have at least 3 wordss."
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
}


- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    
    _passMovie = [_moviesWatched objectAtIndex:index];
    [self performSegueWithIdentifier: @"goToDetails" sender: self];
//    NSLog(@"%@", _passMovie.title);
//    
//    LoadIndividualViewController *lm = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"loadMovie"];
//    
//    lm.movie = _passMovie;
//    [self.navigationController pushViewController: lm animated:YES];
    
}
//
//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"goToDetails"]) {
//        IndividualMovieViewController *iv;
//        iv = [segue destinationViewController];
//        iv.movie = self.passMovie;
//    }
//}

- (void)didSwipeUp:(UICarouselCell *)view withIndex:(NSString*)index {
    
    for(ObjectMO *movie in _moviesWatched){
        if(movie.imdbID == index){
            break;
        }
        _count += 1;
    }
    AppDelegate *appDelegate = (AppDelegate *) UIApplication.sharedApplication.delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    [context deleteObject: _moviesWatched[_count]];
    [self.moviesWatched removeObjectAtIndex: _count];
    [self.carousel removeItemAtIndex:_count animated:YES];
    [self.view reloadInputViews];
    _count = 0;
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ListSearch"]) {
        ListTableViewController *lt;
        lt = [segue destinationViewController];
        lt.movieName = self.movieName;
    }
    else if([segue.identifier isEqualToString:@"goToDetails"]){
        
            IndividualMovieViewController *iv;
            iv = [segue destinationViewController];
            iv.movie = self.passMovie;
        
    }
}





#pragma mark - iCarouselDelegate

@end
