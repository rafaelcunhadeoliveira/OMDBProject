//
//  ObjectMO.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 17/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectMO : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *year;
@property (strong, nonatomic) NSString *imdbID;
@property (strong, nonatomic) NSString *poster;
@property (strong, nonatomic) NSURL *posterurl;
@property (strong, nonatomic) NSString *runtime;
@property (strong, nonatomic) NSString *genre;
@property (strong, nonatomic) NSString *director;
@property (strong, nonatomic) NSString *actors;
@property (strong, nonatomic) NSString *plot;

@end
