//
//  icarouselViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 21/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "icarouselViewController.h"


#import <iCarousel/iCarousel.h>

#import "CarouselCellView.h"

@interface icarouselViewController () <iCarouselDataSource, iCarouselDelegate>

@property (strong, nonatomic) IBOutlet iCarousel *carousel;

@end

@implementation icarouselViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
    return 4;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    CarouselCellView *cellView = [CarouselCellView instanceFromXIB];
    //    cellview.titleLabel.text
    cellView.frame = CGRectMake(0, 0, carousel.bounds.size.width*0.8, carousel.bounds.size.height*0.4);
    CGFloat r = (arc4random() % 255)/255.0;
    CGFloat g = (arc4random() % 255)/255.0;
    CGFloat b = (arc4random() % 255)/255.0;
    cellView.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    return cellView;
}

@end
