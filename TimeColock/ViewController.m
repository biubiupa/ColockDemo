//
//  ViewController.m
//  TimeColock
//
//  Created by malf on 2017/10/31.
//  Copyright © 2017年 DST. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIView *secondView;
@property (strong, nonatomic) UIView *minuteView;
@property (strong, nonatomic) UIView *hourView;
@end

@implementation ViewController






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//设置表盘
//    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clock"]];
//    imageView.bounds=CGRectMake(0, 0, 300, 300);
//    imageView.center=self.view.center;
//    [self.view addSubview:imageView];
    CALayer *layer=[[CALayer alloc] init];
    layer.bounds=CGRectMake(0, 0, 300, 300);
    layer.position=self.view.center;
    layer.contents=(__bridge id _Nullable)[UIImage imageNamed:@"clock"].CGImage;
    [self.view.layer addSublayer:layer];

//时针
    UIView * hourView =[[UIView alloc] init];
    hourView.backgroundColor=[UIColor grayColor];
    hourView.bounds=CGRectMake(0, 0, 3, 80);
    hourView.center=self.view.center;
    hourView.layer.anchorPoint=CGPointMake(0.5, 1);
    self.hourView=hourView;
    [self.view addSubview:hourView];
    //分针
    UIView *minuteView=[[UIView alloc] init];
    minuteView.backgroundColor=[UIColor lightGrayColor];
    minuteView.bounds=CGRectMake(0, 0, 2, 100);
    minuteView.center=self.view.center;
    minuteView.layer.anchorPoint=CGPointMake(0.5, 1);
    self.minuteView=minuteView;
    [self.view addSubview:minuteView];
    //秒针
    UIView *secondView=[[UIView alloc] init];
    secondView.backgroundColor=[UIColor redColor];
    secondView.bounds=CGRectMake(0, 0, 1, 120);
    secondView.center=self.view.center;
    //设置锚点
    secondView.layer.anchorPoint=CGPointMake(0.5, 1);
    self.secondView=secondView;
    [self.view addSubview:secondView];

//创建CADisplayLink
    CADisplayLink *link=[CADisplayLink displayLinkWithTarget:self selector:@selector(transformAngel)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)transformAngel {
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSTimeZone *timeZone=[NSTimeZone localTimeZone];
    NSDate *currentdate=[NSDate date];
    [calendar setTimeZone:timeZone];
    NSDateComponents *currentTime=[calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour|NSCalendarUnitTimeZone fromDate:currentdate];
    
    CGFloat secondAngel=(M_PI * 2 / 60) *currentTime.second;
    self.secondView.transform=CGAffineTransformMakeRotation(secondAngel);
    CGFloat minuteAngel=(M_PI * 2 / 60) *currentTime.minute;
    self.minuteView.transform=CGAffineTransformMakeRotation(minuteAngel);
    CGFloat hourAngel=(M_PI * 2 / 12) *currentTime.hour;
    self.hourView.transform=CGAffineTransformMakeRotation(hourAngel);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
