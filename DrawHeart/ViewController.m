//
//  ViewController.m
//  DrawHeart
//
//  Created by 钱锐博 on 16/5/31.
//  Copyright © 2016年 TurboRun. All rights reserved.
//

#import "ViewController.h"
#import "HeartView.h"

@interface ViewController ()

@property(nonatomic,strong)UISlider *slider;
@property(nonatomic,strong)HeartView *heart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Width : Height better is 4 : 3
    _heart = [[HeartView alloc]initWithFrame:CGRectMake(0, 0, 200, 150)];
    _heart.center = self.view.center;
    _heart.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_heart];
    
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(30, 500, 200, 10)];
    [_slider addTarget:self action:@selector(slider:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_slider];
}

- (void)slider:(UISlider *)sender {
    _heart.value = sender.value;
    [_heart setNeedsDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
