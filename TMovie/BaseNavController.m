//
//  BaseNavController.m
//  TMovie
//
//  Created by Liming Tian on 9/28/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()

@end

@implementation BaseNavController

#pragma -mark ViewController Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all"] forBarMetrics:UIBarMetricsDefault];
    }
}

#pragma -mark Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
