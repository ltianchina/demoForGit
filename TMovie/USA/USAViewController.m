//
//  USAViewController.m
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//
#import "USAViewController.h"
#import "TNetworkService.h"
#import "USAModel.h"
#import "USACell.h"
#import "PosterView.h"

#define kListViewTag   101
#define kPosterViewTag 102


@interface USAViewController ()

@end

@implementation USAViewController

#pragma -mark viewController lifecycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"USA";
    }
    
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    view.backgroundColor = [UIColor blackColor];
    self.view = view;
    [view release];
    
    [self loadListView];
    
    [self loadPosterView];
    
    [self loadNavItemBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(requestData) withObject:nil afterDelay:0.5];
}

#pragma -mark Private Methods
- (void)loadListView
{
    _listView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _listView.backgroundColor = [UIColor blackColor];
    _listView.dataSource = self;
    _listView.delegate = self;
    [self.view addSubview:_listView];
}

- (void)loadPosterView
{
    _posterView = [[PosterView alloc] initWithFrame:self.view.bounds];
    _posterView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_posterView];
}

- (void)loadNavItemBtn
{
    UIImageView *baseImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 49, 25)];
    baseImgView.image = [UIImage imageNamed:@"exchangeBG_home"];
    baseImgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeBrowserMode)];
    [baseImgView addGestureRecognizer:tap];
    [tap release];
    
    UIImageView *listImg = [[UIImageView alloc] initWithFrame:baseImgView.bounds];
    listImg.image = [UIImage imageNamed:@"list_home"];
    listImg.tag = kListViewTag;
    listImg.hidden = YES;
    [baseImgView addSubview:listImg];
    [listImg release];
    
    UIImageView *posterImg = [[UIImageView alloc] initWithFrame:baseImgView.bounds];
    posterImg.image = [UIImage imageNamed:@"poster_home"];
    posterImg.tag = kPosterViewTag;
    [baseImgView addSubview:posterImg];
    [posterImg release];
    
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithCustomView:baseImgView];
    [baseImgView release];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    [rightBtnItem release];
}

- (void)changeBrowserMode
{
    UIView *currentView = self.navigationItem.rightBarButtonItem.customView;
    
    UIView *listView   = [currentView viewWithTag:kListViewTag];
    UIView *posterView = [currentView viewWithTag:kPosterViewTag];
    
    [self setAnimation:self.view flag:posterView.hidden];
    [self setAnimation:currentView flag:posterView.hidden];
    
    if (posterView.hidden) {
        posterView.hidden = NO;
        listView.hidden = YES;
    } else {
        posterView.hidden = YES;
        listView.hidden = NO;
    }
}

- (void)setAnimation:(UIView *)baseView flag:(BOOL)flag
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    
    [baseView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [UIView setAnimationTransition:flag ? UIViewAnimationTransitionFlipFromLeft : UIViewAnimationTransitionFlipFromRight forView:baseView cache:YES];
    
    [UIView commitAnimations];
}

- (void)requestData
{
    NSArray *usaData = [TNetworkService usaData];
    _usaArr = [[NSMutableArray alloc] initWithCapacity:usaData.count];
    for (id data in usaData) {
        _usaModel = [[USAModel alloc] init];
        _usaModel.subject = [data objectForKey:@"subject"];
        [_usaArr addObject:_usaModel];
    }
    [self refreshUI];
}

- (void)refreshUI
{
    [_listView reloadData];
    
    [_posterView reloadPosterData:_usaArr];
}

#pragma -mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_usaArr count];
}

#pragma -mark UITableView DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    USACell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[[USACell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    
    cell.usaCellModel = _usaArr[indexPath.row];
    return cell;
}

#pragma -mark UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
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
    [_usaModel release], _usaModel = nil;
    [_listView release], _listView = nil;
    [_posterView release], _posterView = nil;
    
    [super dealloc];
}

@end
