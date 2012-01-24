//
//  BonjourCulApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/25/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourCulApi.h"

@implementation BonjourCulApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        //        NSLog(@"Initialization of BonjourCulApi");
        _siteURL = [[NSString alloc] initWithString:@"http://bonjourlecul.fr/"];
        _siteName = [[NSString alloc] initWithString:@"bonjourlecul"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='photo']//img/@src"];
    }
    return self;
}

@end
