//
//  ViewController.m
//  Wanwang
//
//  Created by keo on 11/28/12.
//  Copyright (c) 2012 keo. All rights reserved.
//

#import "ViewController.h"
#import "ChaxunViewController.h"



@interface ViewController ()

@end

@implementation ViewController

@synthesize carousel;
@synthesize wrap;
@synthesize tArray;





- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        wrap = YES;
    }
    
    return self;
}

- (void)dealloc
{
    [carousel release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark View lifecycle



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImageView * bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background_home.png"]];
    bgView.frame = CGRectMake(0, 0, 320, 460);
    bgView.userInteractionEnabled = YES;
    [self.view addSubview:bgView];
    
    self.tArray = [NSArray arrayWithObjects:@"check_home.png",@"con_home.png",@"exam_home.png",@"seting_home.png",@"infor_home.png", nil];

    self.carousel = [[iCarousel alloc]init];
    carousel.type = iCarouselTypeRotary;
    carousel.delegate = self;
    carousel.dataSource = self;
    carousel.center = self.view.center;
    carousel.frame = CGRectMake(0, 140, 320, 200);
//    carousel.scrollToItemBoundary = NO;
//    carousel.stopAtItemBoundary = NO;
    [self.view addSubview:carousel];
  
    
}



- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            ChaxunViewController * chaxun = [[ChaxunViewController alloc]init];
            [self presentModalViewController:chaxun animated:YES];
            
            break;
        }
            
            
            
        default:
            break;
    }

}





- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.carousel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}








#pragma mark -

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}


- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed: [self.tArray objectAtIndex:index]]] autorelease];
    
//    UIView *view = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",index]]] autorelease];
    
    view.frame = CGRectMake(10, 80, 100, 100);
    return view;
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	return 0;
}

- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return 5;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 200;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}

- (BOOL)carouselShouldWrap:(iCarousel *)carousel
{
    return wrap;
}




@end
