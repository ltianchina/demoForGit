//
//  MainController.m
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "MainController.h"
#import "USAViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "BaseNavController.h"
@interface MainController ()

@end

@implementation MainController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBar.hidden = YES;
    }
    return self;
}
#pragma -mark ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadSubViews];
    
    [self customTabbar];
}

#pragma -mark Private Methods
- (void)loadSubViews
{
    USAViewController *usaViewController = [[USAViewController alloc] init];
    BaseNavController *usaNavController = [[BaseNavController alloc] initWithRootViewController:usaViewController];
    [usaViewController release];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    BaseNavController *newsNavController = [[BaseNavController alloc] initWithRootViewController:newsViewController];
    [newsViewController release];
    
    TopViewController *topViewController = [[TopViewController alloc] init];
    BaseNavController *topNavController = [[BaseNavController alloc] initWithRootViewController:topViewController];
    [topViewController release];
    
    CinemaViewController *cinemaViewController = [[CinemaViewController alloc] init];
    BaseNavController *cinemaNavController = [[BaseNavController alloc] initWithRootViewController:cinemaViewController];
    [cinemaViewController release];
    
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    BaseNavController *moreNavController = [[BaseNavController alloc] initWithRootViewController:moreViewController];
    [moreViewController release];
    
    NSArray *viewControllers = @[usaNavController,newsNavController,topNavController,cinemaNavController,moreNavController];
    [usaNavController release];
    [newsNavController release];
    [topNavController release];
    [cinemaNavController release];
    [moreNavController release];
    
    [self setViewControllers:viewControllers animated:YES];
}

- (void)customTabbar
{
    _customTabbarBG = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceHeight-65, kDeviceWidth, 65)];
    _customTabbarBG.userInteractionEnabled = YES;
    _customTabbarBG.image = [UIImage imageNamed:@"tab_bg_all"];
    [self.view addSubview:_customTabbarBG];
    
    _selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, _customTabbarBG.height/2.0-55.0/2, (kDeviceWidth-6*8)/5, 45)];
    _selectedImage.image = [UIImage imageNamed:@"selectTabbar_bg_all"];
    [_customTabbarBG addSubview:_selectedImage];
    
    NSArray *items = @[@"usa",@"news",@"top",@"cinema",@"more"];
    int x = 0;
    for (int index = 0; index < 5; index++) {
        
        ItemView *itemView = [[ItemView alloc] initWithFrame:CGRectMake(8+x, _selectedImage.top,_selectedImage.width-10, _selectedImage.height)];
        itemView.delegate = self;
        itemView.tag = index;
        itemView.itemImage.image = [UIImage imageNamed:items[index]];
        itemView.itemTitle.text = items[index];
        [_customTabbarBG addSubview:itemView];
 
        x += _selectedImage.width+10;
    }
    
    
}

#pragma -mark Target-Action
- (void)clickedItemView:(NSInteger)index
{
    [UIView beginAnimations:nil context:NULL];
    _selectedImage.frame = CGRectMake( (_selectedImage.width+10)*index, _customTabbarBG.height/2.0-55.0/2, (kDeviceWidth-6*8)/5, 45);
    [UIView commitAnimations];
    
    self.selectedIndex = index;
}
#pragma -mark Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_customTabbarBG release], _customTabbarBG = nil;
    [_selectedImage release], _selectedImage = nil;
    [super dealloc];
}

@end
