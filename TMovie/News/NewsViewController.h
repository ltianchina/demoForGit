//
//  NewsViewController.h
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum kViewType{
    kEmptyImageView = 0,
    kImageView      = 1,
    kMovieView      = 2
}kViewType;

@interface NewsViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
@private
    UITableView    *_newsTableView;
    
    NSMutableArray *_newsDataArr;
}
@end
