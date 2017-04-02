//
//  LPXCustomTabBar.h
//  咸鱼app的tabBar
//
//  Created by 卢鹏肖 on 2017/4/2.
//  Copyright © 2017年 卢鹏肖. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPXCustomTabBar : UITabBar

//@property(nonatomic,strong)UIButton *publishBtn;

@property (nonatomic,copy) void(^didClickPublishBtn)();


@end
