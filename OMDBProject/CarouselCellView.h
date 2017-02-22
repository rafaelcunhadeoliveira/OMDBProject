//
//  CarouselCellView.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 21/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarouselCellView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;

- (IBAction)tapAction:(UITapGestureRecognizer *)sender;




+ (instancetype)instanceFromXIB;

@end
