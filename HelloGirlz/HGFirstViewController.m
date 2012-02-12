//
//  HGFirstViewController.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "HGFirstViewController.h"
#import "Constants.h"



@implementation HGFirstViewController
@synthesize _scrollView;
@synthesize _pageControl;

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
    
    [self loadImages];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"HGFirstViewController::viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
//        [_imagesDic setObject:aBlankImage forKey:kBonsoirMademoiselle];
    }

    // Load Images in Scrollview
    [self loadImages];
    
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
    
    [self queryAPIs];
    
    // Set Page Title
//    NSLog(@"Setting title for Page = %d",_pageControl.currentPage);
    _navBar.topItem.title = [self getKeyForPage:_pageControl.currentPage];

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - UIScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self._scrollView.frame.size.width;
    int page = floor((self._scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if(_pageControlBeingUsed == NO)
        self._pageControl.currentPage = page;
    
    // Refresh page title
//    NSLog(@"Refresh title for Page = %d",_pageControl.currentPage);
    _navBar.topItem.title = [self getKeyForPage:_pageControl.currentPage];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageControlBeingUsed = NO;
}

#pragma mark - IBAction responder methods

-(IBAction)changePage
{
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self._scrollView.frame.size.width * self._pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self._scrollView.frame.size;
    
    
    [self._scrollView scrollRectToVisible:frame animated:YES];
    
    _pageControlBeingUsed = YES;

}

-(IBAction)refresh
{
    NSLog(@"Refreshing Madames...");
    [self queryAPIs];

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
}

-(void)loadImages
{
    // Purge previous subviews
    for(UIView* view in self._scrollView.subviews)
    {
        [view removeFromSuperview];
    }
    
    // Load Images in ScrollView
    unsigned int i = 0;
    for (NSString* key in _imagesDic) {
//        NSLog(@"Loading image in scrollview for %@",key);
        CGRect frame;
        frame.origin.x = self._scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self._scrollView.frame.size;
        
//        NSLog(@"frame origin x = %f", frame.origin.x);
//        NSLog(@"frame origin x = %f", frame.origin.x);
//        NSLog(@"frame size width = %f", frame.size.width);
//        NSLog(@"frame size heigh = %f", frame.size.height);
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        
//        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self._scrollView.bounds];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:subview.bounds];
        [imgView setImage: [_imagesDic objectForKey:key] ];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [subview addSubview:imgView];

        [self._scrollView addSubview:subview];

        i++;
        
    }
    
    int aNbOfPages = [[_imagesDic allKeys] count];
    self._scrollView.contentSize = CGSizeMake(self._scrollView.frame.size.width * aNbOfPages, self._scrollView.frame.size.height);
    
    _pageControl.numberOfPages = aNbOfPages;
    _pageControlBeingUsed = NO;
}

-(void)updateImageFromUrl:(NSString*)iURL For:(NSString*) iKey;
{
//    NSLog(@"Begin loading image from url %@ for key %@",iURL,iKey);
    // init image from URL
    NSURL* aURL = [NSURL URLWithString:iURL];
    NSError* aErr = nil;
    NSData* data = [[NSData alloc] initWithContentsOfURL:aURL options:NSDataReadingUncached error:&aErr];
    
    
    //Amau 12/02/2012
    //asynchronous task 
    
    NSArray * params = [NSArray arrayWithObjects:iKey,data, nil];
    [self performSelectorInBackground:@selector(loadImageInBackGround:) withObject:params];
    
 //UIImage* img = [[UIImage alloc] initWithData:data];
 //NSLog(@"End loading image from url %@ for key %@",iURL,iKey);
 //Update images dictionary
 //if(img != nil)
 //[_imagesDic setObject:img forKey:iKey];
}



- (void)loadImageInBackGround:  (NSArray*) params{
   // UIImage* image = [[UIImage alloc] initWithData:data] ;
   // [self performSelectorOnMainThread:@selector(displayImage:) withObject:image waitUntilDone:NO];
    NSLog(@"Construction de l'image en background :  %@",[params objectAtIndex:0]);
    UIImage* img = [[UIImage alloc] initWithData:[params objectAtIndex:1]];
    if(img != nil)
        [_imagesDic setObject:img forKey:[params objectAtIndex:0]];
}



-(NSString*)getKeyForPage:(NSInteger)iPage
{
//    NSLog(@"gettingKeyForPage = %d",iPage);
    NSInteger aCounter = 0;
    for (NSString* key in _imagesDic)
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
