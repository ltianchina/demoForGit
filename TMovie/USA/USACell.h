//
//  USACell.h
//  TMovie
//
//  Created by Liming Tian on 10/8/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class USAModel;
@interface USACell : UITableViewCell
{
@private
    UIImageView *_imageView;
    UILabel     *_titleLabel;
    UILabel     *_yearLabel;
    UIView      *_ratingView;
}

@property (nonatomic, retain) USAModel *usaCellModel;
@end
