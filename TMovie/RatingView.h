//
//  RatingView.h
//  RatingViewDemo
//
//  Created by 周泉 on 13-5-27.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G开发培训中心. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum kRatingViewStyle {
    kSmallStyle  = 0,
    kNormalStyle = 1
}kRatingViewStyle;

@interface RatingView : UIView
{
@private
    UIView  *_baseView;   
    UILabel *_ratingLabel;
    NSMutableArray *_yellowStarsArray;
    NSMutableArray *_grayStarsArray;
    CGFloat        _ratingScore;
}

@property (nonatomic, assign) kRatingViewStyle style;
@property (nonatomic, assign) CGFloat ratingScore;

@end
