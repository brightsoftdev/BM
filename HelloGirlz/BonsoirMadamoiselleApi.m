//
//  BonsoirMadameApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonsoirMadamoiselleApi.h"

@implementation BonsoirMadamoiselleApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of BonsoirMadamoiselleApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.bonsoirmademoiselle.com"];
        _siteName = [[NSString alloc] initWithString:@"bonsoirmademoiselle"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//span[@class='attach-post-image']/@src"];
    }
    return self;
}

@end
