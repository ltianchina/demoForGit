//
//  USACell.m
//  TMovie
//
//  Created by Liming Tian on 10/8/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "USACell.h"
#import "USAModel.h"
#import "RatingView.h"
@implementation USACell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initSubviews];
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
    return self;
}

- (void)initSubviews
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_titleLabel];
    
    _yearLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _yearLabel.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_yearLabel];
    
    _ratingView = [[RatingView alloc] initWithFrame:CGRectZero];
    _ratingView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_ratingView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = CGRectMake(10, 10, 60, 80);
    NSString *imgURL = [[self.usaCellModel.subject objectForKey:@"images"] objectForKey:@"medium"];
//    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
//    _imageView.image = [UIImage imageWithData:imgData];
    [_imageView setImageWithURL:[NSURL URLWithString:imgURL]];
    
    _titleLabel.frame = CGRectMake(_imageView.right+5, 10, 180, 40);
    _titleLabel.text = [self.usaCellModel.subject objectForKey:@"title"];
    
    _yearLabel.frame = CGRectMake(_titleLabel.left, _titleLabel.bottom, 90, 40);
    _yearLabel.text = [NSString stringWithFormat:@"year:%@",[self.usaCellModel.subject objectForKey:@"year"]];
    
    _ratingView.frame = CGRectMake(_yearLabel.right, _yearLabel.top+10, 90, 40);
    _ratingView.ratingScore = [[[self.usaCellModel.subject objectForKey:@"rating"] objectForKey:@"average"] floatValue];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
