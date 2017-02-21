//
//  LoadIndividualViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 17/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectMO.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFURLResponseSerialization.h>
#import "UIImageView+AFNetworking.h"

@interface LoadIndividualViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *individualActorsField;
@property (weak, nonatomic) IBOutlet UILabel *individualDurationField;
@property (weak, nonatomic) IBOutlet UIImageView *individualPosterView;
@property (weak, nonatomic) IBOutlet UILabel *individualNameField;
@property (weak, nonatomic) IBOutlet UILabel *individualDescField;
@property (strong, nonatomic) ObjectMO *movie;
@end
