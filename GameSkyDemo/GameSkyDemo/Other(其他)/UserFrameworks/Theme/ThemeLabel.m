//
//  ThemeLabel.m
//  WYWeibPlus
//
//  Created by wxhl on 16/3/15.
//  Copyright © 2016年 yuan.wang. All rights reserved.
//

#import "ThemeLabel.h"

@implementation ThemeLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChanged) name:kThemeDidChanged object:nil];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChanged) name:kThemeDidChanged object:nil];
        
    }
    return self;
}


- (void)setThemeTextColor:(NSString *)themeTextColor {
    
    _themeTextColor = themeTextColor;
    
    [self themeDidChanged];
    
}

- (void)themeDidChanged {
    
    self.textColor = [[ThemeManager shareThemeManager] getColorFromColorName:self.themeTextColor];
    
}


- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    GSDLog(@"%s",__FUNCTION__);
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
