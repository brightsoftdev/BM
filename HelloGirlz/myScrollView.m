//
//  myScrollView.m
//  HelloGirlz
//
//  Created by amaury blanc on 12/02/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "myScrollView.h"

@implementation myScrollView
- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
	if (!self.dragging) {
		[self.nextResponder touchesEnded: touches withEvent:event]; 
	}		
	[super touchesEnded: touches withEvent: event];
}
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	
	if (!self.dragging) {
		[self.nextResponder touchesBegan: touches withEvent:event]; 
	}		
	[super touchesBegan: touches withEvent: event];
}


@end
