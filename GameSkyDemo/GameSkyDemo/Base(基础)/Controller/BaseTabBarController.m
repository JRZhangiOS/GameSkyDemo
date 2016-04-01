//
//  BaseTabBarController.m
//  GameSkyDemo
//
//  Created by wxhl on 14/2/15.
//  Copyright © 2014年 GameSky. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomeViewController.h"
#import "StrategyViewController.h"
#import "SubscribeViewController.h"

@interface BaseTabBarController () {
    ThemeImageView *_maskImageView;
}

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self _createViewController];
    [self _createTabBarItem];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //将字符串转化为类 标签栏按钮
    Class class = NSClassFromString(@"UITabBarButton");
    //遍历标签栏上所有的视图View
    for (UIView *view in self.tabBar.subviews) {
        //判断视图是否是 标签栏按钮(UITabBarButton)或者他的子类创建的
        //如果移除的视图不是标签栏按钮可能导致后续添加的视图添加不上去
        if ([view isKindOfClass:class]) {
            //移除符合条件的标签栏按钮
            [view removeFromSuperview];
            
        }
        
    }
}
/** 创建视图控制器 */
- (void)_createViewController {
    
    UIStoryboard *homeStoryboard = [UIStoryboard storyboardWithName:@"Home" bundle:[NSBundle mainBundle]];
    BaseNavigationController *home = [homeStoryboard instantiateInitialViewController];
    
    UIStoryboard *strategyStoryboard = [UIStoryboard storyboardWithName:@"Strategy" bundle:[NSBundle mainBundle]];
    BaseNavigationController *strategy = [strategyStoryboard instantiateInitialViewController];
    
    UIStoryboard *subscribeStoryboard = [UIStoryboard storyboardWithName:@"Subscribe" bundle:[NSBundle mainBundle]];
    BaseNavigationController *subscribe = [subscribeStoryboard instantiateInitialViewController];
    
    self.viewControllers = @[home,strategy,subscribe];
    
    
}

- (void)_createTabBarItem {
    //创建标签栏背景视图
    _maskImageView = [[ThemeImageView alloc] initWithFrame:self.tabBar.bounds];
    
    _maskImageView.userInteractionEnabled = YES;
    [self.tabBar addSubview:_maskImageView];
    NSArray *array = @[@"Home",@"Strategy",@"Subscribe"];
    for (int i = 0; i < array.count; i++) {
        
        ThemeButton *button = [ThemeButton buttonWithType:UIButtonTypeCustom];
        float margin = 30;
        float x = SCREEN_WIDTH / 5 + margin;
        button.frame = CGRectMake(i * x + margin * 2, 0, 45, 47);
        button.noHighlighted = YES;
        button.normalImageName = [NSString stringWithFormat:@"Item_UIMode_%@@2x.png",array[i]];
        button.selectedImageName = [NSString stringWithFormat:@"Item_UIMode_%@_Selected@2x.png",array[i]];
        button.tag = 1000 + i;
        if (i == 0) {
            button.selected = YES;
        }
        [button addTarget:self action:@selector(_changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        [_maskImageView addSubview:button];
    }
    
    
}

- (void)_changeViewController:(ThemeButton *)sender {
    if (self.selectedIndex == sender.tag - 1000) {
        GSDLog(@"刷新");
        return;
    }
    self.selectedIndex = sender.tag - 1000;
    
    for (ThemeButton *button in _maskImageView.subviews) {
        button.selected = NO;
    }
    sender.selected = YES;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    GSDLog(@"MemoryWarning");
}
- (void)dealloc {
    GSDLog(@"%s",__FUNCTION__);
}
@end
