//
//  CinemaModel.h
//  TMovie
//
//  Created by Liming Tian on 10/14/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModel : NSObject

@property (nonatomic ,copy) NSString *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *director;
@property (nonatomic, copy) NSString *releaseDate;
@end
