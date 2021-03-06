//
//  HomeViewController.m
//  GameSkyDemo
//
//  Created by wxhl on 14/2/15.
//  Copyright © 2014年 GameSky. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
- (IBAction)themeModeChange:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *themeMode;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_GRAY_;
    [self _initSwitchButton];
}
- (void)_initSwitchButton {
    
    NSString *mode = [[NSUserDefaults standardUserDefaults] objectForKey:kThemePreferences];
    
    if (!mode || [mode isEqualToString:@"Normal"]) {
        self.themeMode.on = NO;
        return;
    }
    self.themeMode.on = YES;
    
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
- (IBAction)themeModeChange:(UISwitch *)sender {
    
    ThemeManager *manager = [ThemeManager shareThemeManager];
    if (sender.on) {
        
        manager.themeName = @"Night";
    } else {
        
    manager.themeName = @"Normal";
    }
    
    sender.selected = !sender.selected;
}
- (void)dealloc {
    GSDLog(@"%s",__FUNCTION__);
}

@end
