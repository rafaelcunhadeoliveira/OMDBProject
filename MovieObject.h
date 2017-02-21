//
//  MovieObject.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieObject : NSObject

@property (strong, nonatomic) IBOutlet NSString *title;
@property (strong, nonatomic) IBOutlet NSString *type;
@property (strong, nonatomic) IBOutlet NSString *year;
@property (strong, nonatomic) IBOutlet NSString *imdbID;
@property (strong, nonatomic) IBOutlet NSString *poster;
@property (strong, nonatomic) IBOutlet NSURL *posterurl;
@property (strong, nonatomic) IBOutlet NSString *runtime;
@property (strong, nonatomic) IBOutlet NSString *genre;
@property (strong, nonatomic) IBOutlet NSString *director;
@property (strong, nonatomic) IBOutlet NSString *actors;
@property (strong, nonatomic) IBOutlet NSString *plot;
- (instancetype)initWithData:(NSDictionary *) jsonDataObject;
@end
