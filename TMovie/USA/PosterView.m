//
//  PosterView.m
//  TMovie
//
//  Created by Liming Tian on 10/8/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "PosterView.h"
#import "USAModel.h"
#import "RatingView.h"

#define kHiddenHeaderViewHeight 100
@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initHeaderView];
        
        [self initContentView];
        
        [self initFooterView];
        
        [self bringSubviewToFront:_headerView];
    }
    
    return self;
}


#pragma -mark Private Methods
- (void)initHeaderView
{
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -kHiddenHeaderViewHeight, kDeviceWidth, 25+kHiddenHeaderViewHeight)];
    UIImage *originImg = [UIImage imageNamed:@"indexBG_home"];
    UIImage *new = [originImg stretchableImageWithLeftCapWidth:_headerView.width/2 topCapHeight:2];
    _headerView.image = new;
    _headerView.userInteractionEnabled = YES;
    [self addSubview:_headerView];
    
    _pullBtn = [[UIButton alloc] initWithFrame:CGRectMake(_headerView.width/2, kHiddenHeaderViewHeight+2, 13, 13)];
    [_pullBtn setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_pullBtn addTarget:self action:@selector(pullBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:_pullBtn];
}

- (void)initContentView
{
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0,25, kDeviceWidth,self.height-25-_footerView.height-140)];
    [self addSubview:_contentView];
    
    _conentScorllView = [[UIScrollView alloc] initWithFrame:CGRectMake(40, 40, 240, 230)];
    _conentScorllView.pagingEnabled = YES;
    _conentScorllView.showsHorizontalScrollIndicator = NO;
    _conentScorllView.clipsToBounds = NO;
    _conentScorllView.delegate = self;
    [_contentView addSubview:_conentScorllView];
}

- (void)initFooterView
{
    _footerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, _contentView.bottom, kDeviceWidth, 35)];
    _footerView.image = [UIImage imageNamed:@"poster_title_home"];
    [self addSubview:_footerView];
    
    _footerTitle = [[UILabel alloc] initWithFrame:_footerView.bounds];
    _footerTitle.textColor = [UIColor whiteColor];
    _footerTitle.textAlignment = NSTextAlignmentCenter;
    [_footerView addSubview:_footerTitle];
}

- (void)initMaskView
{
    _maskView = [[UIView alloc] initWithFrame:self.bounds];
    _maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pullBtn:)];
    [_maskView addGestureRecognizer:tap];
    [tap release];
    
    [self insertSubview:_maskView aboveSubview:_contentView];
}
- (void)setContentSize
{
    _footerTitle.text = [[self.scrollData[0] subject] objectForKey:@"title"];
    int x = 0;
    for (int i = 0; i < self.scrollData.count; i++) {
        USAModel *usaModel = self.scrollData[i];

        //flipBaseView
        UIView *flipBaseView = [[UIView alloc] initWithFrame:CGRectMake(20+x, 20, 200, 200)];
        [_conentScorllView addSubview:flipBaseView];
        [flipBaseView release];
        
        //add gesture
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipView:)];
        [flipBaseView addGestureRecognizer:singleTap];
        [singleTap release];
        
        //detailView
        UIView *detailView = [[UIView alloc] initWithFrame:flipBaseView.bounds];
        detailView.backgroundColor = [UIColor grayColor];
        [flipBaseView addSubview:detailView];
        [detailView release];
        //detail image
        UIImageView *detailImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 60)];
        NSString *detailImgURL = [[[usaModel subject] objectForKey:@"images"] objectForKey:@"medium"];
        [detailImg setImageWithURL:[NSURL URLWithString:detailImgURL]];
        [detailView addSubview:detailImg];
        [detailImg release];
        
        UILabel *cnTitle = [[UILabel alloc] initWithFrame:CGRectMake(detailImg.right, detailImg.top, 120, 20)];
        cnTitle.text = [NSString stringWithFormat:@"中文:%@",[[usaModel subject] objectForKey:@"title"]];
        cnTitle.font = [UIFont boldSystemFontOfSize:12];
        [detailView addSubview:cnTitle];
        [cnTitle release];
        
        RatingView *ratingView = [[RatingView alloc] initWithFrame:CGRectMake(30, detailImg.bottom+10, flipBaseView.width, 20)];
        ratingView.style= kSmallStyle;
        ratingView.ratingScore = [[[[usaModel subject] objectForKey:@"rating"] objectForKey:@"average"] floatValue];
        [detailView addSubview:ratingView];
        [ratingView release];
        
        //imageView
        UIImageView *view = [[UIImageView alloc] initWithFrame:flipBaseView.bounds];
        NSString *imgURL = [[[usaModel subject] objectForKey:@"images"] objectForKey:@"large"];
        [view setImageWithURL:[NSURL URLWithString:imgURL]];
        [flipBaseView addSubview:view];
        [view release];
        
        x += _conentScorllView.frame.size.width;
    }
    
    _conentScorllView.contentSize = CGSizeMake(x, _conentScorllView.height);
}

#pragma -mark Target Actions
- (void)flipView:(UITapGestureRecognizer *)tap
{
    UIView *flipView = [tap view];
    [UIView beginAnimations: nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [flipView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    if (flipView.tag == 0) {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:flipView cache:YES];
        flipView.tag = 1;
    } else {
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:flipView cache:YES];
        flipView.tag = 0;
    }
    [UIView commitAnimations];
}

- (void)pullBtn:(UIButton *)button
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    if (_headerView.top == 0) {
        _headerView.top = -100;
        [_pullBtn setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
        [_maskView removeFromSuperview];
    } else {
        _headerView.top = 0;
        [_pullBtn setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateNormal];
        [self initMaskView];
    }
    [UIView commitAnimations];
}
#pragma -mark Public Methods
- (void)reloadPosterData:(NSArray *)data
{
    self.scrollData = data;
    
    [self setContentSize];
}

#pragma -mark UIScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int index = scrollView.contentOffset.x / _conentScorllView.width;
    
    USAModel *usaModel = self.scrollData[index];
    _footerTitle.text = [usaModel.subject objectForKey:@"title"];
}
#pragma -mark Memory
- (void)dealloc
{
    [_maskView release], _maskView = nil;
    [_pullBtn release], _pullBtn = nil;
    [_headerView release], _headerView = nil;
    [_contentView release], _contentView = nil;
    [_conentScorllView release], _conentScorllView = nil;
    [_footerView release], _footerView = nil;
    [_footerTitle release], _footerTitle = nil;

    [super dealloc];
}
@end
