//
//  CinemaModel.m
//  TMovie
//
//  Created by Liming Tian on 10/14/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel
//@private
//UIImageView *_imageView;
//UILabel     *_titleLabel;
//UILabel     *_typeLabel;
//UILabel     *_directorLabel;
//}

- (void)dealloc
{
    self.imageView = nil;
    self.titleLabel = nil;
    self.typeLabel = nil;
    self.directorLabel = nil;
    [super dealloc];
}
@end
