//
//  MoreView.m
//  TMovie
//
//  Created by Liming Tian on 10/15/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "MoreView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        
        _popImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 230, 120, 180)];
        _popImageView.userInteractionEnabled = YES;
        _popImageView.image = [UIImage imageNamed:@"nav_morepopup"];
        [self addSubview:_popImageView];
        
        _moreTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, _popImageView.width, _popImageView.height) style:UITableViewStylePlain];
        _moreTableView.scrollEnabled = NO;
        _moreTableView.layer.cornerRadius = 5;
        _moreTableView.dataSource = self;
        _moreTableView.delegate = self;
        [_popImageView addSubview:_moreTableView];
    }
    
    return self;
}

- (void)dealloc
{
    NSLog(@"More View dealloc");
    [_popImageView release], _popImageView = nil;
    [_moreTableView release], _moreTableView = nil;
    [super dealloc];
}

#pragma -mark TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[UITableViewCell alloc] init] autorelease];
    
    int row = indexPath.row;
    switch (row) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"more_search"];
            cell.textLabel.text = @"搜索";
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"more_fav"];
            cell.textLabel.text = @"收藏";
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"more_set"];
            cell.textLabel.text = @"设置";
            break;
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"more_info"];
            cell.textLabel.text = @"关于";
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma -mark TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(didSelectTableViewIndex:)]) {
        [self.delegate didSelectTableViewIndex:indexPath.row];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.delegate respondsToSelector:@selector(didViewControllerBackground:)]) {
        [self.delegate didViewControllerBackground:self.tag];
        NSLog(@"self.tag = %d",self.tag);
    }
}
@end
