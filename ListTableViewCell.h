//
//  ListTableViewCell.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 15/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *DetailsButton;

- (IBAction)SaveButton:(id)sender;


@end
