//
//  MovieObject.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 14/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "MovieObject.h"

@implementation MovieObject

- (instancetype)initWithData:(NSDictionary *)jsonDataObject
{
    self = [super init];
    
    if (self) {
        _title = jsonDataObject[@"Title"];
        _year = jsonDataObject[@"Year"];
        _runtime = jsonDataObject [@"Runtime"];
        _genre = jsonDataObject [@"Genre"];
        _director = jsonDataObject[@"Director"];
        _actors = jsonDataObject [@"Actors"];
        _plot = jsonDataObject [@"Plot"];
        _type = jsonDataObject [@"Type"];
        _imdbID = jsonDataObject [@"imdbID"];
        _poster = jsonDataObject [@"Poster"];
        _posterurl = [NSURL URLWithString:_poster];

        
    }
    
    return self;
}

@end
