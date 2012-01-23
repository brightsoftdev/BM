//
//  BonjourAsiatApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourAsiatApi.h"

@implementation BonjourAsiatApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of BonjourAsiatApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.bonjourlasiat.tumblr.com"];
        _siteName = [[NSString alloc] initWithString:@"bonjourlasiat"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='postphoto']/a/img/@src"];
    }
    return self;
}

@end
