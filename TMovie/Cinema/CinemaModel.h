//
//  CinemaModel.h
//  TMovie
//
//  Created by Liming Tian on 10/14/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <Foundation/Foundation.h>
//title" : "摩尔庄园2海妖宝藏",
//"image" : "http://img31.mtime.cn/mt/2012/06/28/131128.94272291.jpg",
//"releaseDate" : "7月5日上映",
//"type" : "动画/动作/奇幻/冒险",
//"director" : "刘可欣",

@interface CinemaModel : NSObject

@property (nonatomic ,retain) UIImageView *imageView;
@property (nonatomic, copy) NSString *titleLabel;
@property (nonatomic, copy) NSString *typeLabel;
@property (nonatomic, copy) NSString *directorLabel;
@end
