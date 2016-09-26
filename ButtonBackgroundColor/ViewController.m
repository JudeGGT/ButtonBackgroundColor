//
//  ViewController.m
//  ButtonBackgroundColor
//
//  Created by ggt on 16/9/25.
//  Copyright © 2016年 GGT. All rights reserved.
//

#import "ViewController.h"
#import "GPController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    GPController *vc = [[GPController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
