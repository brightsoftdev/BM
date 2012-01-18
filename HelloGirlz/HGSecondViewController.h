//
//  HGSecondViewController.h
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/13/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HGSecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView* _tableView;
    NSMutableArray* _sites;
}
@property (nonatomic, strong) UITableView* _tableView;

@end
