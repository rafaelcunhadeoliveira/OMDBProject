//
//  CarouselView.m
//  iCarouselSample
//
//  Created by Marcelo Mendes Pereira on 21/02/17.
//  Copyright © 2017 Zup IT. All rights reserved.
//

#import "CarouselCellView.h"

@interface CarouselCellView ()

@end

@implementation CarouselCellView

+ (instancetype)instanceFromXIB {
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"CarouselCellView" owner:self options:nil];
    CarouselCellView *cellView = [subviewArray objectAtIndex:0];
    return cellView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
