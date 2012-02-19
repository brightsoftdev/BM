#import "PhotoViewController.h"
#import "PhotoSet.h"

@implementation PhotoViewController
@synthesize photoSet = _photoSet;


- (id) initWithNavigatorURL:(NSURL*)URL query:(NSDictionary*)query 
{
    NSLog(@"PhotoViewController::initWithNavigatorURL");
    self = [super init];
    if (self != nil) {
        NSLog(@"debug 1");
        self.photoSet = [query objectForKey:@"kPhotoSet"];
        NSLog(@"debug 2");
    }
    return self;
}


- (void) viewDidLoad 
{
    NSLog(@"PhotoViewController::viewDidLoad");
    self.photoSource = self.photoSet;
}



@end