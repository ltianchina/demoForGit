//
//  PosterView.m
//  TMovie
//
//  Created by Liming Tian on 10/8/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "PosterView.h"

@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initHeaderView];
        
        [self initContentView];
        
        [self initFooterView];
    }
    
    return self;
}

#pragma -mark Private Methods
- (void)initHeaderView
{
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 25)];
    _headerView.backgroundColor = [UIColor redColor];
    [self addSubview:_headerView];
}

- (void)initContentView
{
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _headerView.bottom, kDeviceWidth,self.height-_headerView.height-_footerView.height-140)];
    _contentView.backgroundColor = [UIColor purpleColor];
    [self addSubview:_contentView];
    
    _conentScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(40, 40, 240, 230)];
    _conentScorllView.pagingEnabled = YES;
    _conentScorllView.showsHorizontalScrollIndicator = NO;
    _conentScorllView.clipsToBounds = NO;
    _conentScorllView.backgroundColor = [UIColor redColor];
    [_contentView addSubview:_conentScorllView];
}

- (void)initFooterView
{
    _footerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _contentView.bottom, kDeviceWidth, 35)];
    _footerView.backgroundColor = [UIColor redColor];
    [self addSubview:_footerView];
    
}

- (void)setContentSize
{
    NSArray *colors = @[[UIColor yellowColor],[UIColor blueColor],[UIColor yellowColor]];
    int x = 0;
    for (int i = 0; i < self.scrollData.count; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20+x, 20, 200, 200)];
        view.backgroundColor = colors[i%3];
        [_conentScorllView addSubview:view];
        x += _conentScorllView.frame.size.width;
    }
    
    _conentScorllView.contentSize = CGSizeMake(x, _conentScorllView.height);
}
#pragma -mark Public Methods
- (void)reloadPosterData:(NSArray *)data
{
    self.scrollData = data;
    
    [self setContentSize];
}
@end
