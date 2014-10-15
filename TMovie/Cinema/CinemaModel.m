//
//  CinemaModel.m
//  TMovie
//
//  Created by Liming Tian on 10/14/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel

- (void)dealloc
{
    self.image = nil;
    self.title = nil;
    self.type = nil;
    self.director = nil;
    self.releaseDate = nil;
    [super dealloc];
}
@end
