//
//  AuRevoirMadameApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/20/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "AuRevoirMadameApi.h"

@implementation AuRevoirMadameApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
//        NSLog(@"Initialization of AuRevoirMadameApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.aurevoirmadame.fr"];
        _siteName = [[NSString alloc] initWithString:@"aurevoirmadame"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='photo']//img/@src"];
    }
    return self;
}

@end
