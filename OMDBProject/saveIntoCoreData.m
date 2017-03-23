//
//  saveIntoCoreData.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 16/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "saveIntoCoreData.h"



@implementation saveIntoCoreData


+ (instancetype)defaultService {
    static saveIntoCoreData *__defaultService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __defaultService = [[saveIntoCoreData alloc] init];
    });
    
    return __defaultService;
}

-(bool) Save: (MovieObject *) receivedMovie {
    
    //save Movie in CoreData
    AppDelegate *appDelegate = (AppDelegate *) UIApplication.sharedApplication.delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    NSManagedObject* MovieSaver = [NSEntityDescription insertNewObjectForEntityForName:@"Movie" inManagedObjectContext:context];
    [MovieSaver setValue:receivedMovie.title forKey:@"title"];
    [MovieSaver setValue:receivedMovie.year forKey:@"year"];
    [MovieSaver setValue:receivedMovie.poster forKey:@"poster"];
    [MovieSaver setValue:receivedMovie.imdbID forKey:@"imdbID"];
    [MovieSaver setValue:receivedMovie.runtime forKey:@"runtime"];
    [MovieSaver setValue:receivedMovie.genre forKey:@"genre"];
    [MovieSaver setValue:receivedMovie.director forKey:@"director"];
    [MovieSaver setValue:receivedMovie.actors forKey:@"actors"];
    [MovieSaver setValue:receivedMovie.plot forKey:@"plot"];
    [MovieSaver setValue:receivedMovie.type forKey:@"type"];
    
    NSError* error;
    if(![context save:&error]){
        NSLog(@"Error. Couldn't save movie");
        return false;
    }
    return true;
}

-(NSMutableArray<ObjectMO *> *) ReturnAll{
    AppDelegate *appDelegate = (AppDelegate *) UIApplication.sharedApplication.delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Movie" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSMutableArray<ObjectMO*> *result = [[context executeFetchRequest:fetchRequest error:&error] mutableCopy];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        NSLog(@"%@", result);
    }
    return result;
    
}


-(bool) Verify: (NSString *) imdbID{
    AppDelegate *appDelegate = (AppDelegate *) UIApplication.sharedApplication.delegate;
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Movie"];
    NSError *error;
    _results = [context executeFetchRequest:request error:&error];
    for(MovieObject* obj in _results){
        if(obj.imdbID == imdbID){
            return true;
        }
    }
    return false;
}


@end
