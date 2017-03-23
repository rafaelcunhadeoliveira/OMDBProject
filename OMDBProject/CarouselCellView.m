//
//  CarouselCellView.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 21/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "CarouselCellView.h"

@interface CarouselCellView () <UIGestureRecognizerDelegate>

@end

@implementation CarouselCellView 

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UISwipeGestureRecognizer *upRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeUp:)];
    upRecognizer.direction=UISwipeGestureRecognizerDirectionUp;
    upRecognizer.numberOfTouchesRequired = 1;
    [_posterView addGestureRecognizer:upRecognizer];
    // TODO adicionar UISwipeGesture
    // registrar onSwipeUp:
    
}

- (void)onSwipeUp:(UISwipeGestureRecognizer *)gestureRecognizer {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSwipeUp:withIndex:)]) {
        [self.delegate didSwipeUp:self withIndex:self.index];
        NSLog(@"aqui");
    }
}

- (IBAction)swipUp:(id)sender {
}

+ (instancetype)instanceFromXIB {
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"CarouselCellView" owner:self options:nil];
    CarouselCellView *cellView = [subviewArray objectAtIndex:0];
    cellView.posterView.userInteractionEnabled = YES;
    return cellView;
}

@end
