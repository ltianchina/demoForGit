//
//  USACell.h
//  TMovie
//
//  Created by Liming Tian on 10/8/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class USAModel;
@class RatingView;
@interface USACell : UITableViewCell
{
@private
    UIImageView *_imageView;
    UILabel     *_titleLabel;
    UILabel     *_yearLabel;
    RatingView  *_ratingView;
}

@property (nonatomic, retain) USAModel *usaCellModel;
@end
