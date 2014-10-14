//
//  CinemaViewController.m
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "CinemaViewController.h"
#import "TNetworkService.h"

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
    _cinemaDataArr = [[TNetworkService cinemaData] retain];
    
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
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

- (void)dealloc
{
    [_cinemaDataArr release], _cinemaDataArr = nil;
    [super dealloc];
}
@end
