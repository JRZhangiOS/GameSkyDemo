//
//  ThemeButton.h
//  WYWeibPlus
//
//  Created by wxhl on 16/3/14.
//  Copyright © 2016年 yuan.wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton
@property (nonatomic,copy)NSString *normalImageName;
@property (nonatomic,copy)NSString *highlightedImageName;
@property (nonatomic,copy)NSString *selectedImageName;
@property (nonatomic,copy)NSString *disableImageName;
@property (nonatomic,copy)NSString *themeTitleColor;
@property (nonatomic,assign)BOOL noHighlighted;
@end
