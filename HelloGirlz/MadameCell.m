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
    self.selectedBackgroundView.backgroundColor = kHorizontalTableSelectedBackgroundColor;
    
    self.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    return self;
}

@end
