//
//  HGFirstViewController.h
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloApi.h"
#import "BonjourMadameApi.h"

@interface HGFirstViewController : UIViewController<UIScrollViewDelegate, HelloApiDelegate>
{

    IBOutlet UIScrollView* _scrollView;
    IBOutlet UIPageControl* _pageControl;
    
@private
    BOOL _pageControlBeingUsed;
    NSMutableArray* _images;
    BonjourMadameApi* _bonjourMadameApi;
}

@property(nonatomic, strong) UIScrollView* _scrollView;
@property(nonatomic, strong) UIPageControl* _pageControl;

-(IBAction)changePage;

@end
