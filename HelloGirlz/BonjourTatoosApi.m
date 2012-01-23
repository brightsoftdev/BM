//
//  BonjourTatoosApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourTatoosApi.h"

@implementation BonjourTatoosApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of BonjourTatoosApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.bonjourtatoos.tumblr.com"];
        _siteName = [[NSString alloc] initWithString:@"bonjourtatoos"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='photo']/img/@src"];
    }
    return self;
}


@end
