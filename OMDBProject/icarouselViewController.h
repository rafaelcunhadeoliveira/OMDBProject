
//
//  icarouselViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 21/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectMO.h"
#import "saveIntoCoreData.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "UIImageView+AFNetworking.h"
#import <iCarousel/iCarousel.h>
#import "LoadIndividualViewController.h"

@interface icarouselViewController : UIViewController

@property(strong, nonatomic) NSMutableArray<ObjectMO*> *moviesWatched;
@property(strong,nonatomic) ObjectMO *passMovie;


- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index;
- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer;

@end
