//
//  PosterView.h
//  TMovie
//
//  Created by Liming Tian on 10/8/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PosterView : UIView
{
@private
    UIImageView  *_headerView;
    
    UIView       *_contentView;
    UIScrollView *_conentScorllView;
    
    UIImageView  *_footerView;
}

@property (nonatomic, retain) NSArray *scrollData;
- (void)reloadPosterData:(NSArray *)data;
@end
