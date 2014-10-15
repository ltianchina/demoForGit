//
//  MoreView.h
//  TMovie
//
//  Created by Liming Tian on 10/15/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MoreViewDelegate <NSObject>

- (void)didViewControllerBackground:(NSInteger) index;

@end
@interface MoreView : UIView <UITableViewDataSource,UITableViewDelegate>
{
    UIImageView *_popImageView;
    UITableView *_moreTableView;
}
@property (nonatomic, assign) id<MoreViewDelegate> delegate;
@end
