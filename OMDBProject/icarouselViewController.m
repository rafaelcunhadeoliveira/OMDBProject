//
//  icarouselViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 21/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "icarouselViewController.h"


#import "CarouselCellView.h"


@interface icarouselViewController () <iCarouselDataSource, iCarouselDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet iCarousel *carousel;
@end

@implementation icarouselViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    _moviesWatched = [[saveIntoCoreData defaultService] ReturnAll];
    self.carousel.type = iCarouselTypeCoverFlow2;
    self.carousel.dataSource = self;
    self.carousel.delegate = self;
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
    cellView.frame = CGRectMake(0, 0, carousel.bounds.size.width*0.9, carousel.bounds.size.height*0.7);
//    CGFloat r = (arc4random() % 255)/255.0;
//    CGFloat g = (arc4random() % 255)/255.0;
//    CGFloat b = (arc4random() % 255)/255.0;
//    cellView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    cellView.tittleLabel.text = _moviesWatched[index].title;
    [cellView.posterView setImageWithURL:[NSURL URLWithString: _moviesWatched[index].poster]];
    
    
//    _passMovie = _moviesWatched[index];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleImageTap:)];
//    tap.cancelsTouchesInView = YES;
//    tap.numberOfTapsRequired = 1;
//    [cellView.posterView addGestureRecognizer:tap];
    

    return cellView;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
//    [_delegate carousel: self didSelectItemAtIndex:index];
//    _passMovie = _moviesWatched[index];
    _passMovie = [_moviesWatched objectAtIndex:index];
    NSLog(@"%@", _passMovie.title);
    
    LoadIndividualViewController *lm = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"loadMovie"];
    
    lm.movie = _passMovie;
    [self.navigationController pushViewController: lm animated:YES];
    
    
    
}

//- (void) handleImageTap:(UIGestureRecognizer *)gestureRecognizer
//{
////    UIView* view = gestureRecognizer.view;
////    CGPoint loc = [gestureRecognizer locationInView:view];
////    UIView* subview = [view hitTest:loc withEvent:nil];
//    [self performSegueWithIdentifier: @"carouselLoad" sender: _passMovie];
//}
//
//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"carouselLoad"]) {
//        LoadIndividualViewController *iv;
//        iv = [segue destinationViewController];
//        iv.movie = self.passMovie;
//    }
//}


#pragma mark - iCarouselDelegate

@end
