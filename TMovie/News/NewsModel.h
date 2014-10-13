//
//  NewsModel.h
//  TMovie
//
//  Created by Liming Tian on 10/13/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic, retain) NSNumber *id;
@property (nonatomic, retain) NSNumber *type;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *image;
@end
