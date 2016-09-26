//
//  GPController.m
//  ButtonBackgroundColor
//
//  Created by ggt on 16/9/25.
//  Copyright © 2016年 GGT. All rights reserved.
//

#import "GPController.h"
#import "UIButton+BackgroundColor.h"

@implementation GPController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 200, 50)];
    [button setTitle:@"normal" forState:UIControlStateNormal];
    [button setTitle:@"highlighted" forState:UIControlStateHighlighted];
    button.layer.cornerRadius = 10.0f;
    button.layer.masksToBounds = YES;
    [button gp_setBackgroundColor:[UIColor colorWithRed:1.000 green:0.104 blue:0.913 alpha:1.000] forState:GPButtonStateNormal];
    [button gp_setBackgroundColor:[UIColor colorWithRed:0.205 green:1.000 blue:0.781 alpha:1.000] forState:GPButtonStateHighlighted];
    [self.view addSubview:button];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
