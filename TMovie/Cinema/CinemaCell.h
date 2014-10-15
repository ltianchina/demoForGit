//
//  CinemaCell.h
//  TMovie
//
//  Created by Liming Tian on 10/15/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CinemaModel;

@interface CinemaCell : UITableViewCell
{
@private
    UIImageView *_imageView;
    UILabel     *_titleLabel;
    UILabel     *_typeLabel;
    UILabel     *_directorLabel;
    UIImageView *_releaseDateView;
    UILabel     *_monthLabel;
    UILabel     *_dayLabel;
}

@property (nonatomic, retain) CinemaModel *cinemaModel;
@end
