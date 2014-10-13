//
//  TopModel.h
//  TMovie
//
//  Created by Liming Tian on 10/13/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject

@property (nonatomic,retain) NSNumber *id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSDictionary *images;
@property (nonatomic, retain) NSNumber *rating;
@end
