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
#import "TopCell.h"

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
    NSMutableArray *topDataArr = [[NSMutableArray alloc] initWithCapacity:data.count];
    
    for (id content in data) {
        TopModel *topModel = [[TopModel alloc] init];
        topModel.id = [content objectForKey:@"id"];
        topModel.title = [content objectForKey:@"title"];
        topModel.images = [content objectForKey:@"images"];
        topModel.rating = [content objectForKey:@"rating"];
        
        [topDataArr addObject:topModel];
        [topModel release];
    }
    
    NSMutableArray *temp = nil;
    
    _rowArray = [[NSMutableArray alloc] init];
    for (int index = 0; index < topDataArr.count; index++) {
        TopModel *topModel = topDataArr[index];
        if (index %3 == 0) {
            temp = [[NSMutableArray alloc] init];
            [_rowArray addObject:temp];
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
    return [_rowArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    TopCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[[TopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.imageArray = _rowArray[indexPath.row];

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

- (void)dealloc
{
    [_rowArray release], _rowArray = nil;
    [super dealloc];
}

@end
