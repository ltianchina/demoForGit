//
//  CinemaViewController.m
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "CinemaViewController.h"
#import "TNetworkService.h"
#import "CinemaCell.h"
#import "CinemaModel.h"

@interface CinemaViewController ()

@end

@implementation CinemaViewController

#pragma -mark viewController lifecycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"cinema";
    }
    
    
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    [view release];
    
    _cinemaTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-20-65) style:UITableViewStylePlain];
    _cinemaTableView.delegate = self;
    _cinemaTableView.dataSource = self;
    _cinemaTableView.rowHeight = 150;
    [self.view addSubview:_cinemaTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(requestData) withObject:nil afterDelay:1];
}

#pragma -mark Private Methods
- (void)requestData
{
    NSArray *data = [TNetworkService cinemaData];
    
    _cinemaDataArr = [[NSMutableArray alloc] initWithCapacity:data.count];
    
    for (NSDictionary *dicData in data) {
        CinemaModel *cinemaModel = [[CinemaModel alloc] init];

        cinemaModel.image = [dicData objectForKey:@"image"];
        cinemaModel.title = [dicData objectForKey:@"title"];
        cinemaModel.type = [dicData objectForKey:@"type"];
        cinemaModel.director = [dicData objectForKey:@"director"];
        cinemaModel.releaseDate = [dicData objectForKey:@"releaseDate"];
        
        [_cinemaDataArr addObject:cinemaModel];
        [cinemaModel release];
    }
    
    [self refreshUI];
}

- (void)refreshUI
{
    [_cinemaTableView reloadData];
}

#pragma -mark UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cinemaDataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[[CinemaCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.cinemaModel = _cinemaDataArr[indexPath.row];
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
    [_cinemaDataArr release], _cinemaDataArr = nil;
    [super dealloc];
}
@end
