//
//  ListTableViewCell.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 15/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "ListTableViewCell.h"

@implementation ListTableViewCell

- (void)awakeFromNib {
    _loading.hidden = NO;
    [_loading startAnimating];
    [super awakeFromNib];
    [_loading stopAnimating];
    _loading.hidesWhenStopped = true;
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (IBAction)SaveButton:(id)sender {
}
@end
