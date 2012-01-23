//
//  SeinDuJourApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "SeinDuJourApi.h"

@implementation SeinDuJourApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of SeinDuJourApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.seindujour.fr"];
        _siteName = [[NSString alloc] initWithString:@"seindujour"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='field-items']/div/img/@src"];
    }
    return self;
}

@end
