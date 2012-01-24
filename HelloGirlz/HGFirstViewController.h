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
#import "OneDayOneBabeApi.h"
#import "BonjourTetonApi.h"
#import "AuRevoirMadameApi.h"
#import "BonsoirMadamoiselleApi.h"
#import "SeinDuJourApi.h"
#import "BonjourAsiatApi.h"
#import "BonjourTatoosApi.h"
#import "DailyDemoiseilleApi.h"


@interface HGFirstViewController : UIViewController<UIScrollViewDelegate, HelloApiDelegate>
{

    IBOutlet UIScrollView*      _scrollView;
    IBOutlet UIPageControl*     _pageControl;
    IBOutlet UINavigationBar*   _navBar;
    IBOutlet UIBarButtonItem*   _refreshButton;
    
@private
    BOOL _pageControlBeingUsed;
    NSMutableDictionary* _imagesDic;
    BonjourMadameApi* _bonjourMadameApi;
    OneDayOneBabeApi* _onebabeApi;
    BonjourTetonApi* _tetonApi;
    AuRevoirMadameApi* _aurevoirmadameApi;
    BonsoirMadamoiselleApi* _bonsoirmademoiselleApi;
    SeinDuJourApi* _seindujourApi;
    BonjourAsiatApi* _bonjourAsiatApi;
    DailyDemoiseilleApi* _dailyDemoiselleApi;
    
    
}

@property(nonatomic, strong) UIScrollView* _scrollView;
@property(nonatomic, strong) UIPageControl* _pageControl;

-(IBAction)changePage;
-(IBAction)refresh;
-(void)loadImages;
-(void)updateImageFromUrl:(NSString*)iURL For:(NSString*) iKey;
-(void)queryAPIs;
-(NSString*)getKeyForPage:(NSInteger)iPage;

@end
