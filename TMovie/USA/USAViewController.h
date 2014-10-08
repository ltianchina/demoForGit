//
//  USAViewController.h
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class USAModel;

@interface USAViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
@private
    UITableView *_listView;
    UIView      *_posterView;
    USAModel    *_usaModel;
    NSMutableArray *_usaArr;
}
@end
