//
//  TopCell.m
//  TMovie
//
//  Created by Liming Tian on 10/14/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "TopCell.h"
#import "TopView.h"
#import "ItemView.h"
#import "RatingView.h"

@implementation TopCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

#pragma -mark Private Methods
- (void)initSubviews
{
    int x = 0;
    for (int index = 0; index < 3; index++) {
        TopView *topView = [[TopView alloc] initWithFrame:CGRectMake(5+x, 10, 100, 130)];
        topView.backgroundColor = [UIColor clearColor];
        topView.tag = 101+index;
        topView.hidden = YES;
        [self.contentView addSubview:topView];
        [topView release];
        x += 105;
    }
}

#pragma -mark LayoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (int index = 0; index < self.imageArray.count; index++) {
        TopView *topView = (TopView *)[self.contentView  viewWithTag:101+index];
        topView.topModel = self.imageArray[index];
        topView.hidden = NO;
    }
    
    
}

#pragma -mark setter method
- (void)setImageArray:(NSArray *)imageArray
{
    if (_imageArray != imageArray) {
        [_imageArray release];
        
        _imageArray = [imageArray retain];
    
        for (int index = 0; index < 3; index++) {
            TopView *topView = (TopView *)[self.contentView  viewWithTag:101+index];
            topView.hidden = YES;
        }
    }
}
@end
