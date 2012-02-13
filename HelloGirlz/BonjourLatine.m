//
//  BonjourLatine.m
//  HelloGirlz
//
//  Created by amaury blanc on 13/02/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourLatine.h"

@implementation BonjourLatine
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        //        NSLog(@"Initialization of SeinDuJourApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.bonjourlatine.fr/"];
        _siteName = [[NSString alloc] initWithString:@"Bonjour Latine"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='photo']//img/@src"];
    }
    return self;
}

@end
