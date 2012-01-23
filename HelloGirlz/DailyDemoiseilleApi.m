//
//  DailyDemoiseilleApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "DailyDemoiseilleApi.h"

@implementation DailyDemoiseilleApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of DailyDemoiseilleApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.daily-demoiselle.com"];
        _siteName = [[NSString alloc] initWithString:@"dailydemoiselle"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//img[@id='photo1']/@src"];
    }
    return self;
}

-(void)postProcessOnPhotoURL
{
    NSLog(@"DailyDemoiseilleApi::postProcessOnPhotoURL");
    _photoURL = [_siteURL stringByAppendingString:_photoURL];
    [super postProcessOnPhotoURL];
}

@end
