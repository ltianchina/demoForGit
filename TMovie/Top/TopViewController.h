//
//  TopViewController.h
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
@private
    UITableView *_topTableView;
    NSMutableArray *_topDataArr;
}
@end
