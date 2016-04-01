//
//  ThemeBarButtonItem.m
//  WYWeibPlus
//
//  Created by wxhl on 16/3/16.
//  Copyright © 2016年 yuan.wang. All rights reserved.
//

#import "ThemeBarButtonItem.h"

@implementation ThemeBarButtonItem

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.themeTineColor = @"Mask_Title_color";
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChanged) name:kThemeDidChanged object:nil];
    }
    return self;
}

- (void)setThemeTineColor:(NSString *)themeTineColor {
    
    _themeTineColor = themeTineColor;
    
    [self themeDidChanged];
    
}
- (void)themeDidChanged {
    
    
    self.tintColor = [[ThemeManager shareThemeManager] getColorFromColorName:self.themeTineColor];
    
}
- (void)dealloc {
    
    GSDLog(@"%s",__FUNCTION__);
    
}
@end
