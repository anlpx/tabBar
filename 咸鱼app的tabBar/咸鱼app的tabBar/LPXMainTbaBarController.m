//
//  LPXMainTbaBarController.m
//  咸鱼app的tabBar
//
//  Created by 卢鹏肖 on 2017/4/2.
//  Copyright © 2017年 卢鹏肖. All rights reserved.
//

#import "LPXMainTbaBarController.h"

#import "LPXHomeViewController.h"
#import "LPXFishpondViewController.h"
#import "LPXMessageViewController.h"
#import "LPXMyViewController.h"

#import "LPXCustomTabBar.h"

#import "UIView+Extension.h"


@interface LPXMainTbaBarController ()

@property(nonatomic,strong)UIView *zheZhaoView;

@property(nonatomic,strong)NSMutableArray *btnArr;

@property(nonatomic,strong)UIButton *closeBtn;

@end

@implementation LPXMainTbaBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LPXHomeViewController *homeVC = [[LPXHomeViewController alloc] init];
    [self setChildVC:homeVC title:@"主页" image:@"home_normal" selectedImage:@"message_highlight"];
    
    LPXFishpondViewController *fishpidVC = [[LPXFishpondViewController alloc] init];
    [self setChildVC:fishpidVC title:@"鱼塘" image:@"fishpond_normal" selectedImage:@"fishpond_highlight"];
    
    LPXMessageViewController *messageVC = [[LPXMessageViewController alloc] init];
    [self setChildVC:messageVC title:@"消息" image:@"message_normal" selectedImage:@"message_highlight"];
    
    LPXMyViewController *myVC = [[LPXMyViewController alloc] init];
    [self setChildVC:myVC title:@"我的" image:@"account_normal" selectedImage:@"account_highlight"];
    
    LPXCustomTabBar *customTabBar = [[LPXCustomTabBar alloc] init];
    [self setValue:customTabBar forKey:@"tabBar"];
    
    __weak typeof(self) weakSelf = self;
    [customTabBar setDidClickPublishBtn:^{
        weakSelf.zheZhaoView = [[UIView alloc] init];
        
        weakSelf.zheZhaoView.backgroundColor = [UIColor blackColor];
        weakSelf.zheZhaoView.alpha = 0.8;
        weakSelf.zheZhaoView.frame = [UIScreen mainScreen].bounds;
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:weakSelf.zheZhaoView];
        
        self.closeBtn = [[UIButton alloc] init];
        [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"post_animate_add"] forState:UIControlStateNormal];
        self.closeBtn.size = self.closeBtn.currentBackgroundImage.size;
        self.closeBtn.centerX = weakSelf.view.width / 2;
        self.closeBtn.centerY = weakSelf.view.height - weakSelf.tabBar.size.height;
        [self.closeBtn addTarget:self action:@selector(didClickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
        
        [weakSelf.zheZhaoView addSubview:self.closeBtn];
        
        UITapGestureRecognizer *tapView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickView)];
        [weakSelf.zheZhaoView addGestureRecognizer:tapView];
        
    }];
    
}


- (void) didClickView {
    [self.zheZhaoView removeFromSuperview];
}

- (void) didClickCloseBtn {
    [self.zheZhaoView removeFromSuperview];
}

- (void) setChildVC:(UIViewController *)childVC title:(NSString *) title image:(NSString *) image selectedImage:(NSString *) selectedImage {
    
    childVC.tabBarItem.title = title;
    childVC.navigationItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [self addChildViewController:childVC];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

- (NSMutableArray *)btnArr {
    if (_btnArr == nil) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

@end
