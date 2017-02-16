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
        _runtimeMovie = jsonDataObject [@"Runtime"];
        _genreMovie = jsonDataObject [@"Genre"];
        _directorMovie = jsonDataObject[@"Director"];
        _actorsMovie = jsonDataObject [@"Actors"];
        _plotMovie = jsonDataObject [@"Plot"];
        _type = jsonDataObject [@"Type"];
        _imdbID = jsonDataObject [@"imdbID"];
        _poster = jsonDataObject [@"Poster"];
        _posterURL = [NSURL URLWithString:_poster];

        
    }
    
    return self;
}

@end
