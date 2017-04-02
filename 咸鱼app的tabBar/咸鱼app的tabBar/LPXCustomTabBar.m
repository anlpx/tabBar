//
//  LPXCustomTabBar.m
//  咸鱼app的tabBar
//
//  Created by 卢鹏肖 on 2017/4/2.
//  Copyright © 2017年 卢鹏肖. All rights reserved.
//

#import "LPXCustomTabBar.h"
#import "UIView+Extension.h"



@implementation LPXCustomTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIButton *publishBtn = [[UIButton alloc] init];
    [publishBtn setBackgroundImage:[UIImage imageNamed:@"post_animate_add"] forState:UIControlStateNormal];
    [publishBtn addTarget:self action:@selector(didClickPublishBtn:) forControlEvents:UIControlEventTouchUpInside];
    publishBtn.adjustsImageWhenHighlighted = NO;
    publishBtn.size = publishBtn.currentBackgroundImage.size;
    publishBtn.centerX = self.width / 2;
    publishBtn.centerY = 0;
    [self addSubview:publishBtn];
    
    UILabel *lable = [[UILabel alloc] init];
    lable.text = @"发布";
    lable.font = [UIFont systemFontOfSize:10];
    [lable sizeToFit];
    lable.centerX = publishBtn.centerX;
    lable.centerY = publishBtn.centerY + publishBtn.height  * 0.7;
    [self addSubview:lable];
    
    // 其他位置按钮
    NSUInteger count = self.subviews.count;
    for (NSUInteger i = 0 , j = 0; i < count; i++) {
        UIView *view = self.subviews[i];
        Class class = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:class]) {
            view.width = self.width / 5.0;
            view.x = self.width * j / 5.0;
            j++;
            if (j == 2) {
                j++;
            }
        }
    }
    
}

// 点击发布
- (void) didClickPublishBtn:(UIButton *) sender {
//    NSLog(@"点击了发布");
    if (self.didClickPublishBtn) {
        self.didClickPublishBtn();
    }
}

@end
