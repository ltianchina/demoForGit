//
//  NewsModel.m
//  TMovie
//
//  Created by Liming Tian on 10/13/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

//@property (nonatomic, retain) NSNumber *id;
//@property (nonatomic, retain) NSNumber *type;
//@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *summary;
//@property (nonatomic, copy) NSString *image;
- (void)dealloc
{
    self.id    = nil;
    self.type  = nil;
    self.title = nil;
    self.summary = nil;
    self.image = nil;
    [super dealloc];
}
@end
