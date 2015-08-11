//
//  CustomLayerPropertyAnimationViewController.m
//  UIViewAnmationQuestion
//
//  Created by 黄少华 on 15/8/11.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "CustomLayerPropertyAnimationViewController.h"
#import "ClockLayer.h"
@interface CustomLayerPropertyAnimationViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (nonatomic, strong) ClockLayer *clock;
@end

@implementation CustomLayerPropertyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.clock = [[ClockLayer alloc] init];
    self.clock.position = CGPointMake(self.view.bounds.size.width * 0.5, 200);
    [self.view.layer addSublayer:self.clock];
    
    self.clock.time = [NSDate date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setTime:(id)sender {
    self.clock.time = self.timePicker.date;
}

@end
