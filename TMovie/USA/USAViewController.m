//
//  USAViewController.m
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//
#import "USAViewController.h"
#import "TNetworkService.h"

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
    
    [self loadPosterView];
    
    [self loadListView];
    
    [self loadNavItemBtn];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self requestData];
}

#pragma -mark Private Methods
- (void)loadListView
{
    _listView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _listView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:_listView];
}

- (void)loadPosterView
{
    _posterView = [[UIView alloc] initWithFrame:self.view.bounds];
    _posterView.backgroundColor = [UIColor blueColor];
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
    [_listView release], _listView = nil;
    [_posterView release], _posterView = nil;
    
    [super dealloc];
}

@end
