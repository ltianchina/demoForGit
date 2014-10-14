//
//  TNetworkService.m
//  TMovie
//
//  Created by Liming Tian on 10/7/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import "TNetworkService.h"

@implementation TNetworkService

+ (id)parserData:(NSString *)name
{
    NSString *sourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *path = [sourcePath stringByAppendingPathComponent:name];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    return result;
}

+ (id)usaData
{
    return [[self parserData:@"NorthUSA.json"] objectForKey:@"subjects"];
}

+ (id)newsData
{
    return [self parserData:@"news_list.json"];
}

+ (id)topData
{
    return [[self parserData:@"movie_list.json"] objectForKey:@"entries"];
}

+ (id)cinemaData
{
    return [self parserData:@"readyMovie.json"];
}
@end
