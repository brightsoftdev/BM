//
//  BonjourAmatrice.m
//  HelloGirlz
//
//  Created by amaury blanc on 18/02/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourAmatrice.h"

@implementation BonjourAmatrice
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        //        NSLog(@"Initialization of SeinDuJourApi");
        _siteURL = [[NSString alloc] initWithString:@"http://bonjouramatrice.fr/"];
        _siteName = [[NSString alloc] initWithString:@"Bonjour Amatrice"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@id='home']//img/@src"];
    }
    return self;
}
@end
