//
//  MadameAPI.m
//  BonjourMadame
//
//  Created by xavier bourgouin on 7/28/11.
//  Copyright 2011 none. All rights reserved.
//

#import "HelloApi.h"

@implementation HelloApi
@synthesize _delegate;
@synthesize _siteName;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


#pragma  mark - NSURLConnection delegates 
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    
    
    // receivedData is an instance variable declared elsewhere.
    NSLog(@"DidReceiveResponse For %@",_siteURL);
    
    // store encoding name
    if([response textEncodingName] != nil)
        _encodingName = [[NSString alloc] initWithString:[response textEncodingName]];
    else
        _encodingName = [[NSString alloc] initWithString:@"utf-8"];

    
    // reset the data
    [_receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
//    NSLog(@"didReceiveData - %d bytes", [data length]);
    
    [_receivedData appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    NSLog(@"Succeeded! Received %d bytes of data for %@",[_receivedData length], _siteName);
//    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding((__bridge CFStringRef) _encodingName));
//    NSString *payloadAsString = [[NSString alloc] initWithData:_receivedData encoding:encoding];
//    NSLog(@"Payload : %@", payloadAsString);
    
    BOOL bPhotoFound = FALSE;
    
    // Get the BM photo URL
//    NSLog(@"XPATH QUERY %@", _xPathForPhotoURL);
    NSArray *newItemsNodes = PerformHTMLXPathQuery(_receivedData, _xPathForPhotoURL);
    
    for(NSDictionary *node in newItemsNodes)
    {
        NSLog(@"PhotoURL found!! %@", [node objectForKey:@"nodeContent"]);
        _photoURL = [node objectForKey:@"nodeContent"];
        if([self respondsToSelector:@selector(postProcessOnPhotoURL)])
        {
            [self postProcessOnPhotoURL];
        }
        bPhotoFound = TRUE;
    }
    
    // TODO Get the BM Date
    
    // Notify delegate that the photoURL is received
    if([[self _delegate]respondsToSelector:@selector(HelloApi:didReceivePhotoURL:withDate:)] && bPhotoFound)
    {
        [[self _delegate] HelloApi:self didReceivePhotoURL:_photoURL withDate:@"toto"];
    }
}

#pragma mark - API own methods

// Handles the connexion to the BM Site
- (BOOL) connectToSite
{
    NSLog(@"Connecting to Site URL %@",_siteURL);
    // Create the request.
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString: _siteURL ]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    // create the connection with the request
    // and start loading the data
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        _receivedData = [NSMutableData data];
        
        return true;
    } else {
        // Inform the user that the connection failed.
        NSLog(@"The Connection has failed");
        return false;
    }
}

// return true if BM Photo URL is already available
- (BOOL) isConnectionNeeded
{
    if(_photoURL == nil)
    {
//        NSLog(@"Connection is needed");
        return TRUE;
    }

    return FALSE;
}

-(void)postProcessOnPhotoURL
{
    // nothing. to customized in child classes
}

#pragma mark - API interface methods

// Returns false in case the site is not available, true otherwise
- (BOOL) getDailyPhotoURL:(BOOL)ibRefresh
{
    BOOL bResult = FALSE;
    if([self isConnectionNeeded] || ibRefresh)
    {
        // URL is not already available or refresh is asked
        bResult = [self connectToSite];
    }
    else
    {
        // URL is already available
        if([[self _delegate]respondsToSelector:@selector(HelloApi:didReceivePhotoURL:withDate:)])
        {
            [[self _delegate] HelloApi:self didReceivePhotoURL:_photoURL withDate:@"toto"];
        }
        bResult = TRUE;
    }
    
    return bResult;
    
}




@end
