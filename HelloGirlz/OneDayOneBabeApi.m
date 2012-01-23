//
//  OneDayOneBabeApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "OneDayOneBabeApi.h"

@implementation OneDayOneBabeApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of OneDayOneBabeApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.1day1babe.com"];
        _siteName = [[NSString alloc] initWithString:@"onedayonebabe"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='photo']/a/img/@src"];
    }
    return self;
}

@end
