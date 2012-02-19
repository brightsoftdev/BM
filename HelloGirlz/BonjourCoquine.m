//
//  BonjourCoquine.m
//  HelloGirlz
//
//  Created by amaury blanc on 18/02/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourCoquine.h"

@implementation BonjourCoquine
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        //        NSLog(@"Initialization of SeinDuJourApi");
        _siteURL = [[NSString alloc] initWithString:@"http://bonjourcoquine.fr/"];
        _siteName = [[NSString alloc] initWithString:@"Bonjour Coquine"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@id='home']//img/@src"];
    }
    return self;
}
@end
