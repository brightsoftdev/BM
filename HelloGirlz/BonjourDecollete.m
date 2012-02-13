//
//  BonjourDecollete.m
//  HelloGirlz
//
//  Created by amaury blanc on 13/02/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "BonjourDecollete.h"

@implementation BonjourDecollete
- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        //        NSLog(@"Initialization of SeinDuJourApi");
        _siteURL = [[NSString alloc] initWithString:@"http://www.bonjourdecollete.fr/"];
        _siteName = [[NSString alloc] initWithString:@"Bonjour Decolleté"];
        _xPathForPhotoURL = [[NSString alloc] initWithString:@"//div[@class='img']//img/@src"];
    }
    return self;
}
@end
