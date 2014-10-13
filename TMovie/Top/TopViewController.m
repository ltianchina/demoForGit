//
//  TopViewController.m
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "TopViewController.h"
#import "TNetworkService.h"
#import "TopModel.h"

@interface TopViewController ()

@end

@implementation TopViewController

#pragma -mark viewController lifecycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"top";
    }
    
    
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    
    _topTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-20-65) style:UITableViewStylePlain];
    _topTableView.delegate = self;
    _topTableView.dataSource = self;
    _topTableView.rowHeight = 150;
    _topTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_topTableView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestData];
    
}

#pragma -mark Private Methods
- (void)requestData
{
    NSArray *data = [TNetworkService topData];
    _topDataArr = [[NSMutableArray alloc] initWithCapacity:data.count];
    
    NSMutableArray *temp = nil;
    
    for (int index = 0; index < data.count; index++) {
        TopModel *topModel = data[index];
        if (index %3 == 0) {
            temp = [[NSMutableArray alloc] init];
            [_topDataArr addObject:temp];
            [temp release];
        }
        
        [temp addObject:topModel];
    }
    
    [self refreshUI];
}

- (void)refreshUI
{
    [_topTableView reloadData];
}

#pragma -mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_topDataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
 
    cell.textLabel.text = @"test";

    return cell;
}
#pragma -mark Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    if (self.view.window == nil) {
        self.view = nil;
    }
}


@end
