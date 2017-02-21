//
//  LoadCollectionViewController.h
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 20/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectMO.h"
#import "saveIntoCoreData.h"
#import "LoadCellCollectionViewCell.h"

@interface LoadCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet LoadCellCollectionViewCell *cell;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet UICollectionViewFlowLayout *flowLayout;

@property(strong, nonatomic) NSMutableArray<ObjectMO*> *moviesWatched;

@end
