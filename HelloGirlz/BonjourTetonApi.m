//
//  BonjourTetonApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourTetonApi.h"

@implementation BonjourTetonApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of BonjourTetonApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.bonjourteton.tumblr.com"];
        _siteName = [[NSString alloc] initWithString:@"bonjourteton"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='photo']//img/@src"];
    }
    return self;
}

@end
