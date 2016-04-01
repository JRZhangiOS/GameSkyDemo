//
//  ThemeButton.m
//  WYWeibPlus
//
//  Created by wxhl on 16/3/14.
//  Copyright © 2016年 yuan.wang. All rights reserved.
//

#import "ThemeButton.h"

@implementation ThemeButton

+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    
    ThemeButton *button = [super buttonWithType:buttonType];
    
    return button;
}

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
- (void)setNoHighlighted:(BOOL)noHighlighted {
    
    _noHighlighted = noHighlighted;
    
    [self setHighlighted:!_noHighlighted];
    
}
- (void)setHighlighted:(BOOL)highlighted {
    
    if (_noHighlighted) {
        return;
    }
    GSDLog(@"%zd",_noHighlighted);
    [super setHighlighted:highlighted];
    
}
-(void)setNormalImageName:(NSString *)normalImageName {
    
    _normalImageName = normalImageName;
    
    [self themeDidChanged];
}
-(void)setSelectedImageName:(NSString *)selectedImageName {
    
    _selectedImageName = selectedImageName;
    
    [self themeDidChanged];
}
- (void)setThemeTitleColor:(NSString *)themeTitleColor {
    
    _themeTitleColor = themeTitleColor;
    
    [self themeDidChanged];
    
}
- (void)themeDidChanged {
    
    UIImage *image = [[ThemeManager shareThemeManager] getImageFromName:self.normalImageName];
    [self setImage:image forState:UIControlStateNormal];
    
    if (!_noHighlighted) {
        image = [[ThemeManager shareThemeManager] getImageFromName:self.highlightedImageName];
        [self setImage:image forState:UIControlStateHighlighted];
    }
    
    image = [[ThemeManager shareThemeManager] getImageFromName:self.selectedImageName];
    [self setImage:image forState:UIControlStateSelected];
    
    image = [[ThemeManager shareThemeManager] getImageFromName:self.disableImageName];
    [self setImage:image forState:UIControlStateDisabled];
    
    [self setTitleColor:[[ThemeManager shareThemeManager] getColorFromColorName:self.themeTitleColor] forState:UIControlStateNormal];
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)dealloc {
    
    GSDLog(@"%s",__FUNCTION__);
    
}
@end
