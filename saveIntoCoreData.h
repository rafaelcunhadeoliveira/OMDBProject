//
//  saveIntoCoreData.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 16/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieObject.h"
#import "ObjectMO.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface saveIntoCoreData : NSObject
@property(strong, nonatomic) NSArray<MovieObject*> *results;
+ (instancetype)defaultService;
-(bool) Save: (MovieObject *) receivedMovie;
-(NSMutableArray<MovieObject *> *) ReturnAll;
-(bool) Verify: (NSString *) imdbID;
@end
