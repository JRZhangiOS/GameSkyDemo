//
//  StrategyViewController.m
//  GameSkyDemo
//
//  Created by wxhl on 14/2/15.
//  Copyright © 2014年 GameSky. All rights reserved.
//

#import "StrategyViewController.h"

@interface StrategyViewController ()

@end

@implementation StrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_RED_;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    GSDLog(@"MemoryWarning");
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
    GSDLog(@"%s",__FUNCTION__);
}
@end
