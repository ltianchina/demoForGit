//
//  MainController.h
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemView.h"
#import "MoreView.h"

@interface MainController : UITabBarController<ItemViewDelegate,MoreViewDelegate>
{
@private
    UIImageView *_customTabbarBG;
    UIImageView *_selectedImage;
    MoreView    *_moreView;
}
@end
