//
//  iCarouselViewController.m
//  OMDBProject
//
//  Created by Rafael Cunha de Oliveira on 17/02/17.
//  Copyright © 2017 Rafael Cunha de Oliveira. All rights reserved.
//

#import "iCarouselViewController.h"

@interface iCarouselViewController ()
@property (weak, nonatomic) IBOutlet iCarousel *carouselView;

@end

@implementation iCarouselViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//        //set up carousel data
//        _wrap = YES;
//        _receive = [[saveIntoCoreData defaultService] ReturnAll];
//        for(ObjectMO *each in _receive){
//            _posterImages = [[NSMutableArray alloc] init];
//            [_posterImages addObject:each.posterurl];
//            _field = [NSString stringWithFormat:@"%@ (%@)", each.title, each.year];
//            _names = [[NSMutableArray alloc] init];
//            [_names addObject: _field];
//        
//        }
//    }
//    
//    return self;
//}

//- (void)setUp
//{
//    //set up data
//    self.wrap = NO;
//    _receive = [[saveIntoCoreData defaultService] ReturnAll];
//    _posterImages = [[NSMutableArray<NSString *> alloc] init];
//    _names = [[NSMutableArray<NSString *> alloc] init];
//    for(ObjectMO *each in _receive){
//        
//        [_posterImages addObject: each.poster];
//        _field = [NSString stringWithFormat:@"%@ (%@)", each.title, each.year];
//        [_names addObject: _field];
//    }
//    NSLog(@"aqui");
//    
//    UIView *rootView = [[[NSBundle mainBundle] loadNibNamed:@"iCarouselViewController" owner:self options:nil] objectAtIndex:0];
////    UIView *containerView = [[[NSBundle mainBundle] loadNibNamed:@"MyContainerView" owner:self options:nil] lastObject];
////    [rootView addSubview:containerView];
//    [self.view addSubview:rootView];
//}
//
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
//    {
//        [self setUp];
//    }
//    return self;
//}
//
//- (id)initWithCoder:(NSCoder *)aDecoder
//{
//    if ((self = [super initWithCoder:aDecoder]))
//    {
//        [self setUp];
//    }
//    return self;
//}

- (void)dealloc
{
    //it's a good idea to set these to nil here to avoid
    //sending messages to a deallocated viewcontroller
    _aCarousel.delegate = nil;
    _aCarousel.dataSource = nil;
    
}


- (void)viewDidLoad {
    self.aCarousel.type = iCarouselTypeCoverFlow2;
    [super viewDidLoad];
    self.carouselView.delegate = self;
    self.carouselView.dataSource = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
//    return [_posterImages count];
    return 2;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    //limit the number of items views loaded concurrently (for performance reasons)
    return 7;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    //create a numbered view
//    NSURL * imageURL = [NSURL URLWithString:_posterImages[index]];
//    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
//    UIImage * image = [UIImage imageWithData:imageData];
//    UIView *view = [[UIImageView alloc] initWithImage:image];
//    return view;
    UIView *view = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 200, 200)];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    return nil;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    //note: placeholder views are only displayed on some carousels if wrapping is disabled
    return 1;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    //usually this should be slightly wider than the item views
    return 240;
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    //wrap all carousels
    return _wrap;
}

- (void)carouselDidScroll:(iCarousel *)carousel
{
    [_label setText:[NSString stringWithFormat:@"%@", [_names objectAtIndex:carousel.currentItemIndex]]];
}










@end
