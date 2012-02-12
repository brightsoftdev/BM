//
//  HorizontalTableCell.h
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/29/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalTableCell : UITableViewCell<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_horizontalTableView;
    NSMutableDictionary * _madames;
}

@property(nonatomic, strong) UITableView *horizontalTableView;
@property(nonatomic, strong) NSMutableDictionary *madames;

-(UIImage*) getImageFromDictionnaryAtPosition:(NSInteger)position;
-(NSString*) getKeyFromDictionnaryAtPosition:(NSInteger)position;

@end
