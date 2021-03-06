//
//  USAViewController.h
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class USAModel;
@class PosterView;

@interface USAViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
@private
    UITableView     *_listView;
    PosterView      *_posterView;
    USAModel        *_usaModel;
    NSMutableArray  *_usaArr;
}
@end
