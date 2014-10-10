//
//  PosterView.h
//  TMovie
//
//  Created by Liming Tian on 10/8/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PosterView : UIView <UIScrollViewDelegate>
{
@private
    UIImageView  *_headerView;
    UIScrollView *_headerScrollView;
    UIButton     *_pullBtn;
    
    UIView       *_contentView;
    UIScrollView *_conentScorllView;
    
    UIImageView  *_footerView;
    UILabel      *_footerTitle;
    
    UIView       *_maskView;
}

@property (nonatomic, retain) NSArray *scrollData;
- (void)reloadPosterData:(NSArray *)data;
@end
