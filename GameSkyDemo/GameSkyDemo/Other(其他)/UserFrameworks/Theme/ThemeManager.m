//
//  ThemeManager.m
//  WYWeibPlus
//
//  Created by wxhl on 16/3/14.
//  Copyright © 2016年 yuan.wang. All rights reserved.
//

#import "ThemeManager.h"
static ThemeManager *_manager;
@implementation ThemeManager

/** 单例创建ThemeManager */
+ (ThemeManager *)shareThemeManager {
    //固定写法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[ThemeManager alloc] init];
    });
    
    
    
    return _manager;
    
}
/** 单例创建ThemeManager */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    //固定写法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:zone];
    });
    
    
    
    return _manager;
}
/** 单例copy ThemeManager */
- (id)copy {
    //固定写法
    return [ThemeManager shareThemeManager];
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *themePreferences = [[NSUserDefaults standardUserDefaults] objectForKey:kThemePreferences];
        if (themePreferences == nil) {
            _themeName = @"Normal";
        } else {
            _themeName = themePreferences;
        }
        //        [[NSUserDefaults standardUserDefaults] setObject:_themeName forKey:kThemePreferences];
        //        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
    return self;
}

/** 懒加载获得plist文件以及解析plist文件 */
- (NSDictionary *)themeDictionary {
    
    if (!_themeDictionary) {
        //获取plist文件的路径
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"Model" ofType:@"plist"];
        //从plist文件中获取字典
        self.themeDictionary = [NSDictionary dictionaryWithContentsOfFile:themePath];
    }
    return _themeDictionary;
}

- (void)setThemeName:(NSString *)themeName {
    
    _themeName = themeName;
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChanged object:nil];
    [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:kThemePreferences];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

/** 根据图片名称获取绝对路径下的图片 */
- (UIImage *)getImageFromName:(NSString *)name {
    
    
    //将图片路径拼接成绝对路径
    NSString *imagePath = [NSString stringWithFormat:@"%@/%@/%@",[NSBundle mainBundle].resourcePath,self.themeDictionary[self.themeName],name];
    //根据拼接好的路径获得图片
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    GSDLog(@"%@-%@",imagePath,_themeName);
    //将获得的图片返回
    return image;
    
}

- (UIColor *)getColorFromColorName:(NSString *)name {
    
    NSString *themePath = [[NSBundle mainBundle] pathForResource:@"Model" ofType:@"plist"];
    
    self.colorDictionary = [NSDictionary dictionaryWithContentsOfFile:themePath];
    
    NSString *configPath = [NSString stringWithFormat:@"%@/%@/config.plist",[NSBundle mainBundle].resourcePath,self.colorDictionary[self.themeName]];
    
    NSDictionary *configDictionary = [NSDictionary dictionaryWithContentsOfFile:configPath];
    NSDictionary *colorDictionary = configDictionary[name];
    
    
    //获取RGB值
    float r = [colorDictionary[@"R"] floatValue];
    float g = [colorDictionary[@"G"] floatValue];
    float b = [colorDictionary[@"B"] floatValue];
    
    //透明度
    float alpha = 0;
    NSNumber *a = colorDictionary[@"alpha"];
    if (a == nil) {
        alpha = 1;
    } else {
        alpha = [a floatValue];
    }
    
    UIColor *color = [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
    
    return color;
}

- (void)dealloc {
    
    GSDLog(@"%s",__FUNCTION__);
    
}
@end
