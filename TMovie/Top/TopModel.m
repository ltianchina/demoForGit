//
//  TopModel.m
//  TMovie
//
//  Created by Liming Tian on 10/13/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "TopModel.h"

@implementation TopModel

- (void)dealloc
{
    self.id     = nil;
    self.title  = nil;
    self.images = nil;
    self.rating = nil;
    
    [super dealloc];
}
@end
