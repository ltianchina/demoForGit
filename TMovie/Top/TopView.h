//
//  TopView.h
//  TMovie
//
//  Created by Liming Tian on 10/14/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemView,RatingView,TopModel;

@interface TopView : UIView

@property (nonatomic, retain) ItemView   *itemView;
@property (nonatomic, retain) RatingView *ratingView;
@property (nonatomic, retain) TopModel   *topModel;
@end
