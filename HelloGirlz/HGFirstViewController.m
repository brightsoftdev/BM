//
//  HGFirstViewController.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "HGFirstViewController.h"
#import "Constants.h"
#import "HorizontalTableCell.h"
#import "ControlVariables.h"
#import "PhotoViewController.h"
#import "PhotoSet.h"
#import "Photo.h"



@implementation HGFirstViewController
@synthesize _verticaltableView;
@synthesize _pageControl;
@synthesize _maView;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Madame API delegate
-(void) HelloApi:(HelloApi*)api didReceivePhotoURL:(NSString*)url withDate:(NSString*)date;
{
    NSLog(@"HGFirstViewController::did receive Photo URL For site %@ : %@ ", [api _siteName],url);
    
    if(api == _bonjourMadameApi)
    {
        [self updateImageFromUrl:url For:kBonjourMadameName];
    }
    else if(api == _tetonApi)
    {
        [self updateImageFromUrl:url For:kBonjourTeton];
    }
    else if(api == _aurevoirmadameApi)
    {
        [self updateImageFromUrl:url For:kAuRevoirMadame];
    }
    else if(api == _bonsoirmademoiselleApi)
    {
        [self updateImageFromUrl:url For:kBonsoirMademoiselle];
    }
    else if(api == _seindujourApi)
    {
        [self updateImageFromUrl:url For:kSeinDuJour];
    }
    else if(api == _bonjourAsiatApi)
    {
        [self updateImageFromUrl:url For:kBonjourLasiat];
    }
    else if(api == _dailyDemoiselleApi)
    {
        [self updateImageFromUrl:url For:kDailyDemoiselle];
    }
    else if(api == _onebabeApi)
    {
        [self updateImageFromUrl:url For:kOneDayOneBabe];
    }
    else if(api == _bonjourCulApi)
    {
        [self updateImageFromUrl:url For:kBonjourLeCul];
    }
    else if(api == _bonjourLatineApi)
    {
        [self updateImageFromUrl:url For:kBonjourLatine];
    }
    else if(api == _bonjourDecolleteApi)
    {
        [self updateImageFromUrl:url For:kBonjourDecollete];
    }
    else if(api == _bonjourCulotteApi)
    {
        [self updateImageFromUrl:url For:kBonjourCulotte];
    }    
    else if(api == _bonjourAmatriceApi)
    {
        [self updateImageFromUrl:url For:kBonjourAmatrice];
    }    
    else if(api == _bonjourCoquineApi)
    {
        [self updateImageFromUrl:url For:kBonjourCoquine];
    }       
    
    
    
    [self loadImages];

}

#pragma mark - View lifecycle

- (void)awakeFromNib
{
    NSLog(@"HGFirstViewController::awakeFromNib");
    [self._verticaltableView setBackgroundColor:kVerticalTableBackgroundColor];
    self._verticaltableView.rowHeight = kCellHeight + (kRowVerticalPadding * 0.5) + ((kRowVerticalPadding * 0.5) * 0.5);
}

- (void)viewDidLoad
{
    NSLog(@"HGFirstViewController::viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Registrations to notification center here
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receivedFullScreenNotification:) 
                                                 name:@"FULLSCREENDSP"
                                               object:nil];
    
    // EGO Pull down to refresh - init pull down view
    if (_refreshHeaderView == nil) {
        
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] 
                                           initWithFrame:CGRectMake(0.0f, 
                                                                    0.0f - self._verticaltableView.bounds.size.height, 
                                                                    self.view.frame.size.width, 
                                                                    self._verticaltableView.bounds.size.height)];
		view.delegate = self;
		[self._verticaltableView addSubview:view];
		_refreshHeaderView = view;
	}
    
    // Images initialization
    if(_imagesDic == nil)
    {
        _imagesDic = [NSMutableDictionary dictionary];
//                UIImage* aBlankImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"blank" ofType:@"jpg"]];
        UIImage* aBlankImage = [[UIImage alloc] init];
        [_imagesDic setObject:aBlankImage forKey:kBonjourMadameName];
        [_imagesDic setObject:aBlankImage forKey:kDailyDemoiselle];
        [_imagesDic setObject:aBlankImage forKey:kOneDayOneBabe];
        [_imagesDic setObject:aBlankImage forKey:kBonjourLasiat];
        [_imagesDic setObject:aBlankImage forKey:kSeinDuJour];
        [_imagesDic setObject:aBlankImage forKey:kAuRevoirMadame];
        [_imagesDic setObject:aBlankImage forKey:kBonjourTeton];
        [_imagesDic setObject:aBlankImage forKey:kBonjourLeCul];
        [_imagesDic setObject:aBlankImage forKey:kBonjourLatine];
        [_imagesDic setObject:aBlankImage forKey:kBonjourDecollete];
        [_imagesDic setObject:aBlankImage forKey:kBonjourCulotte];
        [_imagesDic setObject:aBlankImage forKey:kBonjourAmatrice];
        [_imagesDic setObject:aBlankImage forKey:kBonjourCoquine];
//        [_imagesDic setObject:aBlankImage forKey:kBonsoirMademoiselle];
    }
    
    // Url dictionnary initialization
    if(_urlDic == nil)
    {
        _urlDic = [NSMutableDictionary dictionary];
        [_urlDic setObject:@"" forKey:kBonjourMadameName];
        [_urlDic setObject:@"" forKey:kDailyDemoiselle];
        [_urlDic setObject:@"" forKey:kOneDayOneBabe];
        [_urlDic setObject:@"" forKey:kBonjourLasiat];
        [_urlDic setObject:@"" forKey:kSeinDuJour];
        [_urlDic setObject:@"" forKey:kAuRevoirMadame];
        [_urlDic setObject:@"" forKey:kBonjourTeton];
        [_urlDic setObject:@"" forKey:kBonjourLeCul];
        [_urlDic setObject:@"" forKey:kBonjourLatine];
        [_urlDic setObject:@"" forKey:kBonjourDecollete];
        [_urlDic setObject:@"" forKey:kBonjourCulotte];
        [_urlDic setObject:@"" forKey:kBonjourAmatrice];
        [_urlDic setObject:@"" forKey:kBonjourCoquine];
    }

    
    // Init and Call Apis
    _bonjourMadameApi = [[BonjourMadameApi alloc] init];
    _bonjourMadameApi._delegate = self;
    
    _onebabeApi = [[OneDayOneBabeApi alloc] init];
    _onebabeApi._delegate = self;
    
    _tetonApi = [[BonjourTetonApi alloc] init];
    _tetonApi._delegate = self;
    
    _aurevoirmadameApi = [[AuRevoirMadameApi alloc]init];
    _aurevoirmadameApi._delegate = self;
    
    
//    _bonsoirmademoiselleApi = [[BonsoirMadamoiselleApi alloc] init];TODO
//    _bonsoirmademoiselleApi._delegate = self;
    
    _seindujourApi = [[SeinDuJourApi alloc] init];
    _seindujourApi._delegate = self;
    
    
    _bonjourAsiatApi = [[BonjourAsiatApi alloc] init];
    _bonjourAsiatApi._delegate = self;
    
    _dailyDemoiselleApi = [[DailyDemoiseilleApi alloc] init];
    _dailyDemoiselleApi._delegate = self;
    
    _bonjourCulApi = [[BonjourCulApi alloc] init];
    _bonjourCulApi._delegate = self;
    
    _bonjourLatineApi = [[BonjourLatine alloc] init];
    _bonjourLatineApi._delegate = self;
    
    _bonjourDecolleteApi = [[BonjourDecollete alloc] init];
    _bonjourDecolleteApi._delegate = self;
    
    _bonjourCulotteApi = [[BonjourCulotte alloc] init];
    _bonjourCulotteApi._delegate = self;
    
    _bonjourAmatriceApi = [[BonjourAmatrice alloc] init];
    _bonjourAmatriceApi._delegate = self;    
    
    _bonjourCoquineApi = [[BonjourCoquine alloc] init];
    _bonjourCoquineApi._delegate = self; 
    
    [self queryAPIs];
    
    // Set Page Title
//    NSLog(@"Setting title for Page = %d",_pageControl.currentPage);
    _navBar.topItem.title = [self getKeyForPage:_pageControl.currentPage];
    
    
    _compteur = 0;
    _fullScreen = FALSE;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

#pragma mark - table view delegates and datasouce

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"HGFirstViewController::numberOfSectionsInTableView");
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"HGFirstViewController::numberOfRowsInSection");
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"HGFirstViewController::cellForRowAtIndexPath");
    static NSString *CellIdentifier = @"HorizontalCell";
    
    HorizontalTableCell *cell = (HorizontalTableCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    if (cell == nil)
    {
        cell = [[HorizontalTableCell alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, tableView.frame.size.height)];
    }
    
    // Register our class as delegate to track the scrolling of the horizontal table
    cell.horizontalTableView.delegate = self;
    
    // Keep a local reference to the horizontal table view in order to control its scroll from the UIPageControl
    _horizontalTableView = cell.horizontalTableView;
    
    // Pass the images to the HorizontalTableCell (to be replaced by better design of the Hello APIs) 
    cell.madames = _imagesDic;
    
    // Refresh the cells of the horizontal table
    [cell.horizontalTableView reloadData];
    
    return cell;
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
    
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    //    [[self tableViewItems] addObject:[NSString 
    //                                      stringWithFormat:@"%@", 
    //                                      [dateFormatter stringFromDate:[NSDate date]]]];
    
    [[self _verticaltableView] reloadData];
    
    [self doneLoadingTableViewData];
}

- (void)doneLoadingTableViewData{
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self._verticaltableView];
}



#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
    NSLog(@"Refreshing Madames...");
    [self performSelectorOnMainThread:@selector(queryAPIs) withObject:nil waitUntilDone:NO];
    
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
	return _reloading; // should return if data source model is reloading
    
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
	return [NSDate date]; // should return date data source was last changed
}



#pragma mark - UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (_horizontalTableView == scrollView) 
    {
        //NSLog(@"HGFirstViewController::scrollViewDidScroll");
        // Deduct the current page based on the cell width + horizontal offset (Y axis since table is rotated 90°)
        CGFloat pageWidth = kCellWidth;
        NSInteger page = floor((scrollView.contentOffset.y - pageWidth / 2) / pageWidth) + 1;
        
        if(_pageControlBeingUsed == NO)
            self._pageControl.currentPage = page;
        
        // Refresh page title
        _navBar.topItem.title = [self getKeyForPage:_pageControl.currentPage];
    }
    
    // EGO Pull down to refresh
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControlBeingUsed = NO;
}

// PULL DOWN TO REFRESH
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];

}


#pragma mark - IBAction responder methods

// Methode appelée lorsqu'on clic sur le pageControl
-(IBAction)changePage
{
    // Deduct the frame to scroll to based on the horizontal table cell width + UIPageControl.currentPage
    CGRect frame;
    frame.origin.x = 0;
    frame.origin.y = kCellWidth * self._pageControl.currentPage;
    frame.size = _horizontalTableView.frame.size;
    
    // Scroll to the frame
    [_horizontalTableView scrollRectToVisible:frame animated:YES];
    _pageControlBeingUsed = YES;
}

-(IBAction)refresh
{
    NSLog(@"Refreshing Madames...");
    [self queryAPIs];
}


#pragma mark - Notification Center callbacks

- (void)receivedFullScreenNotification:(NSNotification *)notification 
{
    NSLog(@"HGFirstViewController::receivedFullScreenNotification");
    HGAppDelegate *appDelegate = (HGAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if(_fullScreen == FALSE)
    {
//        //Enter fullscreen
//        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
//        UIImageView* imgViewFromCell = [[notification userInfo] valueForKey:@"imgview"];
//        UIImageView* aFreshImageView = [[UIImageView alloc] initWithImage:imgViewFromCell.image];
//        aFreshImageView.tag = kTagForFullScreenView;
//        aFreshImageView.frame =[[UIScreen mainScreen] applicationFrame];
//        aFreshImageView.contentMode = UIViewContentModeScaleAspectFit;
//        aFreshImageView.backgroundColor = [UIColor blackColor];
//        
//        [appDelegate.window addSubview:aFreshImageView];
        
        NSMutableArray* aPhotosArr = [[NSMutableArray alloc] init];
        
        for(NSString* key in _urlDic)
        {
            // TODO create the array of Photo objects (needs photo URLs)
            NSString* aURL = [_urlDic objectForKey:key];
            if(aURL)   
            {
                NSLog(@"HGFirstViewController::receivedFullScreenNotification - adding URL %@ to the Photo array",aURL);
                Photo* aPhoto = [[Photo alloc] initWithCaption:key urlLarge:aURL urlSmall:aURL urlThumb:aURL size:CGSizeMake(320, 320)];
                [aPhotosArr addObject:aPhoto];
            }
        }
        
        PhotoSet* aPhotoSet = [[PhotoSet alloc] initWithTitle:@"toto" photos:aPhotosArr];
//        TTURLAction *action =  [[[TTURLAction actionWithURLPath:@"tt://appPhotos"] applyQuery:[NSDictionary dictionaryWithObject:aPhotoSet forKey:@"kPhotoSet"]] applyAnimated:YES];
//        NSLog(@"debug 3");
//        
//        [[TTNavigator navigator] openURLAction:action];
        

        
        PhotoViewController* aPhotoViewController = [[PhotoViewController alloc] init];
        aPhotoViewController.photoSource = aPhotoSet;
//        [appDelegate.window addSubview:aPhotoViewController.view];

        [[self navigationController] pushViewController:aPhotoViewController animated:YES];

        _fullScreen = TRUE;
    }
    else
    {
        //Exit fullscreen
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
        [[appDelegate.window viewWithTag:kTagForFullScreenView] removeFromSuperview];
        _fullScreen = FALSE;
    }
}

#pragma mark - Other methods

-(void)queryAPIs
{
    
    // Call Apis
    if(_bonjourMadameApi)   [_bonjourMadameApi getDailyPhotoURL:TRUE];
    
    if(_onebabeApi)         [_onebabeApi getDailyPhotoURL:TRUE];
    
    if(_tetonApi)           [_tetonApi getDailyPhotoURL:TRUE];
    
    if(_aurevoirmadameApi)  [_aurevoirmadameApi getDailyPhotoURL:TRUE];
    
    //    _bonsoirmademoiselleApi = [[BonsoirMadamoiselleApi alloc] init];TODO
    //    _bonsoirmademoiselleApi._delegate = self;
    //    [_bonsoirmademoiselleApi getDailyPhotoURL];

    if(_seindujourApi)      [_seindujourApi getDailyPhotoURL:TRUE];
    
    if(_bonjourAsiatApi)    [_bonjourAsiatApi getDailyPhotoURL:TRUE];
    
    if(_dailyDemoiselleApi) [_dailyDemoiselleApi getDailyPhotoURL:TRUE];
    
    if(_bonjourCulApi)      [_bonjourCulApi getDailyPhotoURL:TRUE];
    
    if(_bonjourLatineApi)   [_bonjourLatineApi getDailyPhotoURL:TRUE];
    
    if(_bonjourDecolleteApi)[_bonjourDecolleteApi getDailyPhotoURL:TRUE];
    
    if(_bonjourCulotteApi)  [_bonjourCulotteApi getDailyPhotoURL:TRUE];
    
    if(_bonjourAmatriceApi)  [_bonjourAmatriceApi getDailyPhotoURL:TRUE];
    
    if(_bonjourCoquineApi)  [_bonjourCoquineApi getDailyPhotoURL:TRUE];
}

-(void)loadImages
{
// A VIRER PLUS TARD - CONSERVE POUR REFERENCE (construction des subviews et des images dans conteneur)
//    // Purge previous subviews
//    for(UIView* view in self._scrollView.subviews)
//    {
//        [view removeFromSuperview];
//    }
//    
//    // Load Images in ScrollView
//    unsigned int i = 0;
//    //allkeys http://stackoverflow.com/questions/8640565/error-collection-nscfdictionary-0x563560-was-mutated-while-being-enume
//    for (NSString* key in [_imagesDic allKeys]) {
////        NSLog(@"Loading image in scrollview for %@",key);
//        CGRect frame;
//        frame.origin.x = self._scrollView.frame.size.width * i;
//        frame.origin.y = 0;
//        frame.size = self._scrollView.frame.size;
//        
////        NSLog(@"frame origin x = %f", frame.origin.x);
////        NSLog(@"frame origin x = %f", frame.origin.x);
////        NSLog(@"frame size width = %f", frame.size.width);
////        NSLog(@"frame size heigh = %f", frame.size.height);
//        
//        UIView *subview = [[UIView alloc] initWithFrame:frame];
//
////        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self._scrollView.bounds];
//        UIImageView *imgView = [[UIImageView alloc] initWithFrame:subview.bounds];
//        
//        
//        [imgView setImage: [_imagesDic objectForKey:key] ];
//        imgView.contentMode = UIViewContentModeScaleAspectFit;
//        [subview addSubview:imgView];
//        [subview setTag:i];
//        
//        [self._scrollView addSubview:subview];
//
//
//        i++;
//        
//    }
    
    int aNbOfPages = [[_imagesDic allKeys] count];
    [_verticaltableView reloadData];
//    self._scrollView.contentSize = CGSizeMake(self._scrollView.frame.size.width * aNbOfPages, self._scrollView.frame.size.height);
    
    _pageControl.numberOfPages = aNbOfPages;
    _pageControlBeingUsed = NO;
}

-(void)updateImageFromUrl:(NSString*)iURL For:(NSString*) iKey;
{
    // init image from URL
    NSURL* aURL = [NSURL URLWithString:iURL];
    
    //Amau 12/02/2012
    //asynchronous task 
    NSArray * params = [NSArray arrayWithObjects:iKey,aURL, nil];
    [self performSelectorInBackground:@selector(loadImageInBackGround:) withObject:params];
    
    // Update url dictionary
    [_urlDic setObject:iURL forKey:iKey];
}



- (void)loadImageInBackGround:  (NSArray*) params{
    //on compte le nombre d'image crées
    _compteur = _compteur + 1;
    [_refreshButton setEnabled:NO];
    _reloading = YES;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSLog(@"Construction de l'image en background :  %@",[params objectAtIndex:0]);
    NSData* data = [[NSData alloc] initWithContentsOfURL:[params objectAtIndex:1] options:NSDataReadingUncached error:nil];
    UIImage* img = [[UIImage alloc] initWithData:data];
    if(img != nil)
        [_imagesDic setObject:img forKey:[params objectAtIndex:0]];
    else
        NSLog(@"L'image n'est pas crée %@",[params objectAtIndex:0]);
    
    
    _compteur = _compteur - 1;
    if (_compteur == 0) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self loadImages];
        
        [[self _verticaltableView] reloadData];
        [_refreshButton setEnabled:YES];
        [self doneLoadingTableViewData];
    }

}

-(NSString*)getKeyForPage:(NSInteger)iPage
{
//    NSLog(@"gettingKeyForPage = %d",iPage);
    NSInteger aCounter = 0;
    //allkeys http://stackoverflow.com/questions/8640565/error-collection-nscfdictionary-0x563560-was-mutated-while-being-enume
    for (NSString* key in [_imagesDic allKeys])
    {
        if(aCounter == iPage)
        {
//            NSLog(@"Found key: %@",key);
            return key;
        }
        aCounter++;
    }
    return nil;
}

@end
