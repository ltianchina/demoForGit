//
//  TopView.m
//  TMovie
//
//  Created by Liming Tian on 10/14/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "TopView.h"
#import "ItemView.h"
#import "RatingView.h"
#import "TopModel.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initSubViews];
    }
    
    return self;
}

- (void)initSubViews
{
    _itemView = [[ItemView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height - 20)];
    _itemView.itemImage.frame = CGRectMake(0, 0, _itemView.width, _itemView.height-10);
    _itemView.itemTitle.frame = CGRectMake(0, _itemView.bottom-10, _itemView.width, 10);
    _itemView.itemTitle.backgroundColor = [UIColor blackColor];
    [self addSubview:_itemView];
    
    _ratingView = [[RatingView alloc] initWithFrame:CGRectMake(0, _itemView.bottom, self.width, 20)];
    [self addSubview:_ratingView];
}

- (void)setTopModel:(TopModel *)topModel
{
    if (_topModel != topModel) {
        [_topModel release];
        _topModel = [topModel retain];
        
        //itemView setValue
        [_itemView.itemImage setImageWithURL:[NSURL URLWithString:[self.topModel.images objectForKey:@"medium"]]];
        _itemView.itemTitle.text = self.topModel.title;
        
        //ratingView setValue
        _ratingView.ratingScore = [self.topModel.rating integerValue];
    }
}
- (void)dealloc
{
    [_itemView release], _itemView = nil;
    [super dealloc];
}
@end
