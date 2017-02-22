//
//  iCarouselViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 17/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
#import "ObjectMO.h"
#import "saveIntoCoreData.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "UIImageView+AFNetworking.h"

@interface iCarouselViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>;


@property (nonatomic) BOOL wrap;
@property (strong, nonatomic) NSMutableArray<ObjectMO *> *receive;
@property (strong, nonatomic) NSMutableArray<NSString *> *posterImages;
@property (strong, nonatomic) NSMutableArray<NSString *> *names;
@property (strong, nonatomic) NSString *field;
@property (weak, nonatomic) IBOutlet UIImageView *carousel;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel;
@property (strong, nonatomic) IBOutlet iCarousel *aCarousel;
- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel;
@end
