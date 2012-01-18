//
//  BonjourMadameApi.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/18/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourMadameApi.h"

@implementation BonjourMadameApi

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        NSLog(@"Initialization of BonjourMadameApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.bonjourmadame.fr"];
        _siteName = @"bonjourmadame";
        _xPathForPhotoURL = @"//div[@class='photo']/a/img/@src";
    }
    return self;
}




@end
