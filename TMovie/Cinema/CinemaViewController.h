//
//  CinemaViewController.h
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CinemaViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
@private
    NSMutableArray *_cinemaDataArr;
    UITableView    *_cinemaTableView;
}
@end
