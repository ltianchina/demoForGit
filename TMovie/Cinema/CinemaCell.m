//
//  CinemaCell.m
//  TMovie
//
//  Created by Liming Tian on 10/15/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "CinemaCell.h"
#import "CinemaModel.h"
@implementation CinemaCell

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

- (void)initSubviews
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_titleLabel];
    
    _typeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_typeLabel];
    
    _directorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_directorLabel];
    
    _releaseDateView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _releaseDateView.image = [UIImage imageNamed:@"theater_coming"];
    [self.contentView addSubview:_releaseDateView];
    
    _monthLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _monthLabel.textAlignment = NSTextAlignmentCenter;
    _monthLabel.backgroundColor = [UIColor clearColor];
    [_releaseDateView addSubview:_monthLabel];
    
    _dayLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _dayLabel.textAlignment = NSTextAlignmentCenter;
    _dayLabel.backgroundColor = [UIColor clearColor];
    [_releaseDateView addSubview:_dayLabel];
}

- (void)layoutSubviews
{
    _imageView.frame = CGRectMake(10, 10, 80, self.height-20);
    
    [_imageView setImageWithURL:[NSURL URLWithString:self.cinemaModel.image]];
    
    _titleLabel.frame = CGRectMake(_imageView.right, _imageView.top, 140, _imageView.height/3);
    _titleLabel.font = [UIFont boldSystemFontOfSize:14];
    _titleLabel.text = self.cinemaModel.title;
    
    _typeLabel.frame = CGRectMake(_titleLabel.left, _titleLabel.bottom, _titleLabel.width, _titleLabel.height);
    _typeLabel.font = [UIFont systemFontOfSize:12];
    _typeLabel.text = self.cinemaModel.type;
    
    _directorLabel.frame = CGRectMake(_typeLabel.left, _typeLabel.bottom, _typeLabel.width, _typeLabel.height);
    _directorLabel.font = [UIFont systemFontOfSize:12];
    _directorLabel.text = self.cinemaModel.director;
    
    _releaseDateView.frame = CGRectMake(_titleLabel.right, _titleLabel.bottom, 60, 60);
    _monthLabel.frame = CGRectMake(0, 0, 60, 30);
    _dayLabel.frame = CGRectMake(0, 30, 60, 30);
    
    int month,day;
    char *releaseDate = (char *)[self.cinemaModel.releaseDate UTF8String];
    
    sscanf(releaseDate, "%d月%d日",&month,&day);
    
    _monthLabel.text = [NSString stringWithFormat:@"%d月",month];
    _dayLabel.text = [NSString stringWithFormat:@"%d",day];
}

- (void)dealloc
{
    [_imageView release], _imageView = nil;
    [_titleLabel release], _titleLabel = nil;
    [_typeLabel release], _typeLabel = nil;
    [_directorLabel release], _directorLabel = nil;
    [_releaseDateView release], _releaseDateView = nil;
    [_monthLabel release], _monthLabel = nil;
    [_dayLabel release], _dayLabel = nil;
    [super dealloc];
}
@end
