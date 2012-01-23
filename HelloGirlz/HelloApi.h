//
//  MadameAPI.h
//  BonjourMadame
//
//  Created by xavier bourgouin on 7/28/11.
//  Copyright 2011 none. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPathQuery.h"


@protocol HelloApiDelegate;

// Classe HelloApi
@interface HelloApi : NSObject{
    
@private
    
    NSMutableData* _receivedData;
    NSString* _encodingName;
    
@public
    NSString* _photoURL;
    NSString* _siteURL;
    NSString* _siteName;
    NSString* _xPathForPhotoURL;
    
    
@public
    id<HelloApiDelegate> _delegate;
}

- (BOOL) connectToSite;
- (BOOL) isConnectionNeeded;
- (BOOL) getDailyPhotoURL:(BOOL)ibRefresh;
- (void) postProcessOnPhotoURL;
@property(nonatomic, strong) id<HelloApiDelegate> _delegate;
@property(nonatomic, strong) NSString* _siteName;
@end

// Protocol HelloApiDelegate
@protocol HelloApiDelegate <NSObject>
    @optional
    -(void) HelloApi:(HelloApi*)api didReceivePhotoURL:(NSString*)url withDate:(NSString*)date;

@end
