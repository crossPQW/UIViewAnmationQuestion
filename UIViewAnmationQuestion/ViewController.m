//
//  ViewController.m
//  UIViewAnmationQuestion
//
//  Created by 黄少华 on 15/8/10.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@property (weak, nonatomic) IBOutlet UIView *oriangeView;
@property (weak, nonatomic) IBOutlet UIButton *runlabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    [self test0];
    
//    [self test1];
    
//    [self test2];
    
//    [self test3];
    
    [self test4];
    
}

- (void)test4
{
    CGRect boundingRect = CGRectMake(-150, -150, 300, 300);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    
    orbit.duration = 4.f;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALL;
    
    //控制关键帧动画时间
    orbit.calculationMode = kCAAnimationPaced;
    //确保图层围着路径旋转
    orbit.rotationMode = kCAAnimationRotateAuto;
    
    [self.runlabel.layer addAnimation:orbit forKey:@"runPath"];
    
}

- (void)test3
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[@0,@10,@-10,@10,@0];
    animation.keyTimes = @[@0,@(1/6.0),@(3/6.0),@(5/6.0),@1];
    //@[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ]
    animation.duration = 0.5f;
    
    //additive属性为yes是的core aimation在更新presentation layer之前将动画的值添加到model layer上去,
    animation.additive = YES;
    [self.blueView.layer addAnimation:animation forKey:@"shake"];
}

- (void)test2
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    animation.keyPath = @"position.x";
    animation.byValue = @200;
    animation.duration = 1;
    
    
    [self.blueView.layer addAnimation:animation forKey:@"position"];
    
    self.blueView.layer.position = CGPointMake(200, 50);
    
    animation.beginTime = CACurrentMediaTime() + 0.5;
    
    [self.oriangeView.layer addAnimation:animation forKey:@"position"];
    self.oriangeView.layer.position = CGPointMake(200, 150);
}

//解决办法:
//1:修改原layer的属性,让其model layer tree改变为动画之后的属性,推荐
//2:设置fillmode,然后设置removedOnCompletion为NO,防止移除presentationLayer,会造成额外的内存开销.
- (void)test1
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @20;
    animation.toValue = @200;
    animation.duration = 2.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self.blueView.layer addAnimation:animation forKey:@"animationKey"];

    
}

//动画会回到原先位置,因为Core Animation维护了两个平行layer层次结构,model layer Tree(模型层🌲)跟presentation layer tree(表现层🌲),前者中的layers反应了我们能直接看到的layers的状态,后者的layers则是动画正在表现的值相似.

//之所以会回到原先位置,是因为动画不会在其超出时间之后还会修改presentation layer,在结束的事后它会倍彻底移除
- (void)test0
{
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @20;
    animation.toValue = @200;
    animation.duration = 2.f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    [self.blueView.layer addAnimation:animation forKey:@"animationKey"];
}
@end

