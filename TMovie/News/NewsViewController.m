//
//  NewsViewController.m
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "NewsViewController.h"
#import "TNetworkService.h"
#import "NewsModel.h"
#import "ItemView.h"

@interface NewsViewController ()

@end

@implementation NewsViewController

#pragma -mark viewController lifecycle
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"news";
    }
    
    
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.view = view;
    [view release];
    
    [self initNewsTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:@selector(requetData) withObject:nil afterDelay:1];
}

#pragma -mark Private Methods
- (void)initNewsTableView
{
    _newsTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-20-65) style:UITableViewStylePlain];
    _newsTableView.rowHeight = 60;
    _newsTableView.delegate = self;
    _newsTableView.dataSource = self;
    [self.view addSubview:_newsTableView];
}

- (void)requetData
{
    NSArray *datas = [TNetworkService newsData];
    
    _newsDataArr = [[NSMutableArray alloc] initWithCapacity:datas.count];
    
    for (id data in datas) {
        NewsModel *newsModel = [[NewsModel alloc] init];
        newsModel.id      = [data objectForKey:@"id"];
        newsModel.type    = [data objectForKey:@"type"];
        newsModel.title   = [data objectForKey:@"title"];
        newsModel.summary = [data objectForKey:@"summary"];
        newsModel.image   = [data objectForKey:@"image"];
        
        [_newsDataArr addObject:newsModel];
        [newsModel release];
    }
    
    [self refreshUI];
    
}

- (void)refreshUI
{
    [self initHeaderView];
    
    [_newsTableView reloadData];
}

- (void)initHeaderView
{
    NewsModel *newsModel =  _newsDataArr[0];
    ItemView *headerView = [[ItemView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 180)];
    headerView.itemImage.frame = CGRectMake(0, 0, kDeviceWidth, headerView.height);
    [headerView.itemImage setImageWithURL:[NSURL URLWithString:newsModel.image]];
    headerView.itemTitle.frame = CGRectMake(0, headerView.height-30, kDeviceWidth, 20);
    headerView.itemTitle.font = [UIFont boldSystemFontOfSize:16];
    headerView.itemTitle.text = newsModel.title;
    _newsTableView.tableHeaderView = headerView;
    [headerView release];
}

#pragma -mark UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_newsDataArr count]-1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 50)];
        imageView.tag = 1000;
        [cell.contentView addSubview:imageView];
        [imageView release];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right, imageView.top, kDeviceWidth-imageView.width, 30)];
        title.tag = 1001;
        [cell.contentView addSubview:title];
        [title release];
        
        UILabel *detail = [[UILabel alloc] initWithFrame:CGRectMake(imageView.right, title.bottom, title.width, 20)];
        detail.tag = 1002;
        [cell.contentView addSubview:detail];
        [detail release];
        
        UIImageView *imageType = [[UIImageView alloc] initWithFrame:CGRectMake(imageView.right, title.bottom+5, 30, 20)];
        imageType.hidden = YES;
        imageType.tag = 103;
        [cell.contentView addSubview:imageType];
        [imageType release];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    NewsModel *newsModel = _newsDataArr[indexPath.row + 1];
    
    UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:1000];
    [imageView setImageWithURL:[NSURL URLWithString:newsModel.image]];
    UILabel *title = (UILabel *)[cell.contentView viewWithTag:1001];
    title.text = newsModel.title;
    title.font = [UIFont systemFontOfSize:18];
    UILabel *detail = (UILabel *)[cell.contentView viewWithTag:1002];
    detail.text = newsModel.summary;
    detail.font = [UIFont systemFontOfSize:12];
    detail.textColor = [UIColor grayColor];
    UIImageView *imageType = (UIImageView *)[cell.contentView viewWithTag:103];
    int type = [newsModel.type intValue];
    
    if (type == kEmptyImageView) {
        imageType.hidden = YES;
        detail.left = imageView.right+5;
    } else if (type == kImageView) {
        imageType.hidden = NO;
        imageType.image = [UIImage imageNamed:@"sctpxw"];
        detail.left = imageType.right+5;
    } else if (type == kMovieView) {
        imageType.hidden = NO;
        imageType.image = [UIImage imageNamed:@"scspxw"];
        detail.left = imageType.right+5;
    }
    
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
    [_newsDataArr release], _newsDataArr = nil;
    [_newsTableView release], _newsTableView = nil;
    [super dealloc];
}

@end
