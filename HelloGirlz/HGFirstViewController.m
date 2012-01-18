//
//  HGFirstViewController.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "HGFirstViewController.h"



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
    NSLog(@"HGFirstViewController::did receive Photo URL!! %@",url);
    if(api == _bonjourMadameApi)
    {
        NSLog(@"HGFirstViewController::coming from bonjourMadameAPI !");
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    NSLog(@"HGFirstViewController::viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _images = [[NSMutableArray alloc] initWithObjects: 
              [[NSBundle mainBundle] pathForResource:@"ar" ofType:@"jpg"], 
              [[NSBundle mainBundle] pathForResource:@"asiat" ofType:@"jpg"],
              [[NSBundle mainBundle] pathForResource:@"bc" ofType:@"jpg"],
              [[NSBundle mainBundle] pathForResource:@"bm" ofType:@"jpg"],
              [[NSBundle mainBundle] pathForResource:@"BMA" ofType:@"jpg"], 
              [[NSBundle mainBundle] pathForResource:@"bt" ofType:@"jpg"],
              [[NSBundle mainBundle] pathForResource:@"db" ofType:@"jpg"],
              [[NSBundle mainBundle] pathForResource:@"dd" ofType:@"jpeg"],
              nil];
    
    for (int i = 0; i < _images.count; i++) {
        CGRect frame;
        frame.origin.x = self._scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self._scrollView.frame.size;
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self._scrollView.bounds];
        UIImage *img = [[UIImage alloc] initWithContentsOfFile:[_images objectAtIndex:i]];
        [imgView setImage:img];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        
        [subview addSubview:imgView];
        [self._scrollView addSubview:subview];
    }
    self._scrollView.contentSize = CGSizeMake(self._scrollView.frame.size.width * _images.count, self._scrollView.frame.size.height);
    
    _pageControl.numberOfPages = _images.count;
    _pageControlBeingUsed = NO;
    
    // temporary
    _bonjourMadameApi = [[BonjourMadameApi alloc] init];
    _bonjourMadameApi._delegate = self;
    [_bonjourMadameApi getDailyPhotoURL];
    
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

@end
