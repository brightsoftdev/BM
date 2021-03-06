//
//  MadameCell.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/30/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "MadameCell.h"
#import "ControlVariables.h"

@implementation MadameCell

@synthesize thumbnail = _thumbnail;

- (NSString *)reuseIdentifier 
{
    return @"MadameCell";
}


- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"MadameCell::initWithFrame");
    self = [super initWithFrame:frame];
    
    self.thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(kArticleCellHorizontalInnerPadding, kArticleCellVerticalInnerPadding, kCellWidth - kArticleCellHorizontalInnerPadding * 2, kCellHeight - kArticleCellVerticalInnerPadding * 2)];
    self.thumbnail.opaque = YES;
    self.thumbnail.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:self.thumbnail];
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0.40784314 blue:0.21568627 alpha:1.0];
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.thumbnail.frame];
//    self.selectedBackgroundView.backgroundColor = kHorizontalTableSelectedBackgroundColor;
    
    self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{
    NSInteger nbTouches = [[touches anyObject] tapCount];
    NSLog(@"Nombre de touches dans MadameCell.m %d",nbTouches);
    if(nbTouches == 2)
    {
        // Notify whoever registered to the FULLSCREENDSP Notification that a fullscreen is needed
        NSDictionary* data = [NSDictionary dictionaryWithObject:self.thumbnail forKey:@"imgview"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"FULLSCREENDSP" object:self userInfo:data];
    }
}

@end
