//
//  HGFirstViewController.h
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Three20/Three20.h"
#import "EGORefreshTableHeaderView.h"
#import "HelloApi.h"
#import "HGAppDelegate.h"
#import "BonjourMadameApi.h"
#import "OneDayOneBabeApi.h"
#import "BonjourTetonApi.h"
#import "AuRevoirMadameApi.h"
#import "BonsoirMadamoiselleApi.h"
#import "SeinDuJourApi.h"
#import "BonjourAsiatApi.h"
#import "BonjourTatoosApi.h"
#import "DailyDemoiseilleApi.h"
#import "BonjourCulApi.h"
#import "BonjourLatine.h"
#import "BonjourDecollete.h"
#import "BonjourCulotte.h"
#import "BonjourAmatrice.h"
#import "BonjourCoquine.h"


@interface HGFirstViewController : UIViewController<HelloApiDelegate, EGORefreshTableHeaderDelegate, UITableViewDelegate, UITableViewDataSource>
{
    
    IBOutlet UITableView*       _verticaltableView;
    IBOutlet UIView*            _maView;
    IBOutlet UIPageControl*     _pageControl;
    IBOutlet UINavigationBar*   _navBar;
    IBOutlet UIBarButtonItem*   _refreshButton;
    
    // EGO Pull down to refresh
    EGORefreshTableHeaderView*  _refreshHeaderView;
    BOOL _reloading;
    
@private
    BOOL                    _pageControlBeingUsed;
    NSMutableDictionary*    _imagesDic;
    NSMutableDictionary*    _urlDic;
    UITableView *           _horizontalTableView;
    BonjourMadameApi*       _bonjourMadameApi;
    OneDayOneBabeApi*       _onebabeApi;
    BonjourTetonApi*        _tetonApi;
    AuRevoirMadameApi*      _aurevoirmadameApi;
    BonsoirMadamoiselleApi* _bonsoirmademoiselleApi;
    SeinDuJourApi*          _seindujourApi;
    BonjourAsiatApi*        _bonjourAsiatApi;
    DailyDemoiseilleApi*    _dailyDemoiselleApi;
    BonjourCulApi*          _bonjourCulApi;
    BonjourLatine*          _bonjourLatineApi;
    BonjourDecollete*       _bonjourDecolleteApi;
    BonjourCulotte*         _bonjourCulotteApi;
    BonjourAmatrice*        _bonjourAmatriceApi;
    BonjourCoquine*         _bonjourCoquineApi;
    
    
    
    NSInteger               _compteur;
    BOOL                    _fullScreen;
}

@property(nonatomic, strong) UIView* _maView;
@property(nonatomic, strong) UITableView* _verticaltableView;
@property(nonatomic, strong) UIPageControl* _pageControl;

-(IBAction)changePage;
-(IBAction)refresh;
-(void)loadImages;
-(void)updateImageFromUrl:(NSString*)iURL For:(NSString*) iKey;
-(void)queryAPIs;
-(NSString*)getKeyForPage:(NSInteger)iPage;
- (void)loadImageInBackGround:  (NSArray*) params;

// EGO PULL DOWN TO REFRESH
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

@end
