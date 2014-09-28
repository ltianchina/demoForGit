//
//  MainController.h
//  TMovie
//
//  Created by Liming Tian on 9/27/14.
//  Copyright (c) 2014 Liming Tian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemView.h"

@interface MainController : UITabBarController<ItemViewDelegate>
{
@private
    UIImageView *_customTabbarBG;
    UIImageView *_selectedImage;
}
@end
