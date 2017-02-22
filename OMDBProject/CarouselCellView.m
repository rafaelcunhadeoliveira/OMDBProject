//
//  CarouselCellView.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 21/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "CarouselCellView.h"

@interface CarouselCellView ()


@end

@implementation CarouselCellView





+ (instancetype)instanceFromXIB {
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"CarouselCellView" owner:self options:nil];
    CarouselCellView *cellView = [subviewArray objectAtIndex:0];
    cellView.posterView.userInteractionEnabled = YES;
    return cellView;
}

@end
