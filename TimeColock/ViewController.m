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
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSTimeZone *timeZone=[NSTimeZone localTimeZone];
    NSDate *currentdate=[NSDate date];
    [calendar setTimeZone:timeZone];
    NSDateComponents *currentTime=[calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour|NSCalendarUnitTimeZone fromDate:currentdate];
//设置表盘
    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"clock"]];
    imageView.bounds=CGRectMake(0, 0, 300, 300);
    imageView.center=self.view.center;
    [self.view addSubview:imageView];
//秒针
    UIView *secondView=[[UIView alloc] init];
    secondView.backgroundColor=[UIColor redColor];
    secondView.bounds=CGRectMake(0, 0, 1, 120);
    secondView.center=self.view.center;
    //设置锚点
    secondView.layer.anchorPoint=CGPointMake(0.5, 1);
    self.secondView=secondView;
    [self.view addSubview:secondView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
