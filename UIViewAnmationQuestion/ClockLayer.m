//
//  ClockLayer.m
//  UIViewAnmationQuestion
//
//  Created by 黄少华 on 15/8/11.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "ClockLayer.h"
#import <UIKit/UIKit.h>
@interface ClockLayer()

@property (nonatomic, strong) CAShapeLayer *hourHand;

@property (nonatomic, strong) CAShapeLayer *minuteHand;
@end

@implementation ClockLayer
- (instancetype)init
{
    if (self = [super init]) {
        
        self.bounds = CGRectMake(0, 0, 200, 200);
        self.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
        self.fillColor = [UIColor yellowColor].CGColor;
        self.strokeColor = [UIColor purpleColor].CGColor;
        self.lineWidth = 4.f;
        
        self.hourHand = [CAShapeLayer layer];
        self.hourHand.path = [UIBezierPath bezierPathWithRect:CGRectMake(-2, -80, 4, 80)].CGPath;
        self.hourHand.fillColor = [UIColor greenColor].CGColor;
        self.hourHand.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        [self addSublayer:self.hourHand];
        
        self.minuteHand = [CAShapeLayer layer];
        self.minuteHand.path = [UIBezierPath bezierPathWithRect:CGRectMake(-1, -90, 2, 90)].CGPath;
        self.minuteHand.fillColor = [UIColor blueColor].CGColor;
        self.minuteHand.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        [self addSublayer:self.minuteHand];
    }
    return self;
}

- (void)setTime:(NSDate *)time
{
    _time = time;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit | NSMinuteCalendarUnit fromDate:time];
    self.hourHand.affineTransform = CGAffineTransformMakeRotation(components.hour / 12.0 * 2.0 * M_PI);
    self.minuteHand.affineTransform = CGAffineTransformMakeRotation(components.minute / 60.f * 2.0 * M_PI);
}

@end
