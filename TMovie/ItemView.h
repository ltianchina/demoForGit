//
//  ItemView.h
//  TMovie
//
//  Created by Liming Tian on 9/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ItemViewDelegate <NSObject>

- (void)clickedItemView:(NSInteger)index;

@end

@interface ItemView : UIView

@property (nonatomic, readonly) UIImageView *itemImage;
@property (nonatomic, readonly) UILabel     *itemTitle;
@property (nonatomic, assign) id<ItemViewDelegate> delegate;
@end

