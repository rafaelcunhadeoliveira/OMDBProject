//
//  CarouselCellView.h
//  iCarouselSample
//
//  Created by Marcelo Mendes Pereira on 21/02/17.
//  Copyright © 2017 Zup IT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarouselCellView : UIView

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

+ (instancetype)instanceFromXIB;

@end
