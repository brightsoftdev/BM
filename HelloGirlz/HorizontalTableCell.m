//
//  HorizontalTableCell.m
//  HelloGirlz
//
//  Created by xavier bourgouin on 1/29/12.
//  Copyright (c) 2012 none. All rights reserved.
//

#import "HorizontalTableCell.h"
#import "ControlVariables.h"
#import "MadameCell.h"

@implementation HorizontalTableCell

@synthesize horizontalTableView = _horizontalTableView;
@synthesize madames = _madames;

- (NSString *) reuseIdentifier 
{
    return @"HorizontalCell";
}

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"HorizontalTableCell::cellForRowAtIndexPath");
    if ((self = [super initWithFrame:frame]))
    {
        self.horizontalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kCellHeight, kTableLength)];
        self.horizontalTableView.showsVerticalScrollIndicator = NO;
        self.horizontalTableView.showsHorizontalScrollIndicator = NO;
        self.horizontalTableView.transform = CGAffineTransformMakeRotation(-M_PI * 0.5);
        [self.horizontalTableView setFrame:CGRectMake(kRowHorizontalPadding * 0.5, kRowVerticalPadding * 0.5, kTableLength - kRowHorizontalPadding, kCellHeight)];
        
        self.horizontalTableView.rowHeight = kCellWidth;
        self.horizontalTableView.backgroundColor = kHorizontalTableBackgroundColor;
        
        self.horizontalTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.horizontalTableView.separatorColor = [UIColor clearColor];
        
        self.horizontalTableView.dataSource = self;
        self.horizontalTableView.delegate = self;
        
        self.horizontalTableView.pagingEnabled = YES;
        
        [self addSubview:self.horizontalTableView];
    }
    
    return self;
}


#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{   
    NSLog(@"HorizontalTableCell::numberOfRowsInSection = %d",[self.madames count] );
    return [self.madames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"HorizontalTableCell::cellForRowAtIndexPath");
    static NSString *cellIdentifier = @"MadameCell";
    
    MadameCell *cell = (MadameCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) 
    {
        cell = [[MadameCell alloc] initWithFrame:CGRectMake(0, 0, kCellWidth, kCellHeight)];
    }
    
    UIImage *img = [self getImageFromDictionnaryAtPosition:indexPath.row];
    
    if(img != nil)  cell.thumbnail.image = img;
    
    return cell;
}

#pragma mark - Custom methods

-(UIImage*) getImageFromDictionnaryAtPosition:(NSInteger)position
{
    NSLog(@"HorizontalTableCell::getImageFromDictionnaryAtPosition = %d", position);
    NSInteger counter = 0;
    for(NSString* key in _madames)
    {
        if(counter == position)
            return (UIImage*)[_madames objectForKey:key];
        else
            counter++;
    }
    NSLog(@"HorizontalTableCell::getImageFromDictionnaryAtPosition - image not found");
    return nil;
}

-(NSString*) getKeyFromDictionnaryAtPosition:(NSInteger)position
{
    NSLog(@"HorizontalTableCell::getImageFromDictionnaryAtPosition = %d", position);
    NSInteger counter = 0;
    for(NSString* key in _madames)
    {
        if(counter == position)
            return key;
        else
            counter++;
    }
    return nil;
    
    
}

@end




//[[NSNotificationCenter defaultCenter] postNotificationName:@"sauversousparcelle" object:nil];
//on s'abonne aux notification qui viennent de addParcelle.m pour gerer les actions de la subview
//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveAddParcelle)    name:@"sauverparcelle"   object:nil];
