//
//  CarouselCellView.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 21/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UICarouselCell;

@protocol UICarouselCellDelegate<NSObject>

@optional

- (void)didSwipeUp:(UICarouselCell *)view withIndex:(NSString*)index;

@end

@interface CarouselCellView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;
@property NSString* index;
@property (weak, nonatomic) id<UICarouselCellDelegate> delegate;


- (void)onSwipeUp:(UISwipeGestureRecognizer *)gestureRecognizer;
+ (instancetype)instanceFromXIB;

@end
