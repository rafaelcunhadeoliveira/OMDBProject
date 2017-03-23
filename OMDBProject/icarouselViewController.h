
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
#import "ListTableViewController.h"

@interface icarouselViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property(strong, nonatomic) NSMutableArray<ObjectMO *> *moviesWatched;
@property(strong,nonatomic) ObjectMO *passMovie;
@property(strong,nonatomic) ObjectMO *actualMovie;
@property(strong, nonatomic) NSString *movieName;
//@property(strong, nonatomic) UISwipeGestureRecognizer *upRecognizer;
@property(strong, nonatomic) UITapGestureRecognizer *hideKeyboard;
@property int count;
- (IBAction)search:(id)sender;

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index;

@end
