//
//  ItemView.m
//  TMovie
//
//  Created by Liming Tian on 9/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "ItemView.h"

@implementation ItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubViews];
        
        [self addGesture];
    }
    
    return self;
}

#pragma -mark Private Methods
- (void)initSubViews
{
    _itemImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
    _itemImage.userInteractionEnabled = YES;
    _itemImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_itemImage];
    
    _itemTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height/2, self.width, self.height/2-5)];
    _itemTitle.textAlignment = NSTextAlignmentCenter;
    _itemTitle.font = [UIFont boldSystemFontOfSize:10];
    _itemTitle.textColor = [UIColor whiteColor];
    [self addSubview:_itemTitle];
}

- (void)addGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedItem)];
    [self addGestureRecognizer:tap];
    [tap release];
}

- (void)clickedItem
{
    if ([self.delegate respondsToSelector:@selector(clickedItemView:)]) {
        [self.delegate clickedItemView:self.tag];
    }
}

#pragma -mark Memory
- (void)dealloc
{
    [_itemImage release], _itemImage = nil;
    [_itemTitle release], _itemTitle = nil;
    [super dealloc];
}
@end
