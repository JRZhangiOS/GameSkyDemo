//
//  ThemeManager.h
//  WYWeibPlus
//
//  Created by wxhl on 16/3/14.
//  Copyright © 2016年 yuan.wang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kThemeDidChanged @"ThemeDidChanged"  //通知名字

#define kThemePreferences @"UserThemePreferences"  //偏好设置

@interface ThemeManager : NSObject

@property (nonatomic,copy) NSString *themeName;

@property (nonatomic,strong) NSDictionary *themeDictionary;

@property (nonatomic,strong) NSDictionary *colorDictionary;

+ (ThemeManager *)shareThemeManager;

- (UIImage *)getImageFromName:(NSString *)name;

- (UIColor *)getColorFromColorName:(NSString *)name;

@end
