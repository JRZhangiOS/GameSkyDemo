//
//  BaseViewController.m
//  GameSkyDemo
//
//  Created by wxhl on 14/2/15.
//  Copyright © 2014年 GameSky. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeDidChanged) name:kThemeDidChanged object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self themeDidChanged];
}

- (void)themeDidChanged {
    
//    UIImage *image = [[ThemeManager shareThemeManager] getImageFromName:@"bg_home.jpg"];
//    
//    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, self.view.bounds);
//    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithCGImage:imageRef]];
//    
//    CGImageRelease(imageRef);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    GSDLog(@"%s",__FUNCTION__);
}
@end
