//
//  ViewController.h
//  Wanwang
//
//  Created by keo on 11/28/12.
//  Copyright (c) 2012 keo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"


@interface ViewController : UIViewController<iCarouselDataSource, iCarouselDelegate>

@property (retain,nonatomic) iCarousel * carousel;
@property (nonatomic,assign) BOOL wrap;
@property (retain,nonatomic) NSArray * tArray;


@end
