//
//  ThemeImageView.m
//  WYWeibPlus
//
//  Created by wxhl on 16/3/14.
//  Copyright © 2016年 yuan.wang. All rights reserved.
//

#import "ThemeImageView.h"

@implementation ThemeImageView

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



- (void)setImageName:(NSString *)imageName {
    
    _imageName = imageName;
    
    [self themeDidChanged];
    
}

- (void)themeDidChanged {
    
    
    
    UIImage *image = [[ThemeManager shareThemeManager] getImageFromName:self.imageName];
    
    if (self.imageEdgeInsets.top ||self.imageEdgeInsets.bottom||self.imageEdgeInsets.left||self.imageEdgeInsets.right) {
        image = [image resizableImageWithCapInsets:self.imageEdgeInsets resizingMode:UIImageResizingModeTile];
    }
    
    
    self.image = image;
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    GSDLog(@"%s",__FUNCTION__);
    
}

@end
