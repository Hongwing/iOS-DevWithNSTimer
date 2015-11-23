//
//  ViewController.m
//  NSTimer
//
//  Created by lister on 15/11/23.
//  Copyright (c) 2015年 hongwing.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) UIAlertView *alert;
@property (strong,nonatomic) NSTimer *timer;

@end

@implementation ViewController
int flag = 10;
int min = 1;
int sec = 59;
// start the timer
- (IBAction)clickToStart:(id)sender
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                  target:self
                                                selector:@selector(changeTimeOnLabel)
                                                userInfo:nil
                                                 repeats:YES];
        [_timer fire];
    }
}

- (void)changeTimeOnLabel
{
    self.labelDisplay.text = [NSString stringWithFormat:@"%d",flag--];
   // [self clockControl];
    
   // if(min == 0 && sec == 0)
    if (flag == -1)
    {
        self.labelDisplay.text = @"END";
        [self.alert show];
        [self.timer invalidate];
        self.timer = nil;
    }
    
}

- (void)clockControl
{
    // 1 秒针为0时更新分针
    if (sec == 0) {
        self.labelDisplay.text = [NSString stringWithFormat:@"%d:%d",min--,59];
    }
    // 2 分针为0时弹出alerview
    if (min == 0 && sec == 0) {
        self.labelDisplay.text = @"END";
        [self.alert show];
        [self.timer invalidate];
        self.timer = nil;
        self.labelDisplay.text = [NSString stringWithFormat:@"%d:%d",1,1];

    }
}

// stop the timer
- (IBAction)clickToStop:(id)sender
{
    if (_timer)
    {
        NSLog(@"self.timer is true.");
        if ([_timer isValid])
        {
            NSLog(@"click stop to end.");
            [_timer invalidate];
            
            // 将当前timer作废
            _timer = nil;
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        self.labelDisplay.text = [NSString stringWithFormat:@"%d",10];
        flag = 10;
    }
    
}

// init
- (void)initAllOfIt
{
    self.alert = [[UIAlertView alloc] initWithTitle:@"Tips" message:@"Time is up !" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initAllOfIt];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
