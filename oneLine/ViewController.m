//
//  ViewController.m
//  oneLine
//
//  Created by Aditya Narayan on 6/24/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.mapView addGestureRecognizer:panGestureRecognizer];
    
    UIPanGestureRecognizer *baseRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(baseGesture:)];
    [self.baseView addGestureRecognizer:baseRecognizer];
    
    self.bs = baseRecognizer.view.frame.origin.x;
    self.by = baseRecognizer.view.frame.origin.y;
    
    self.path = [UIBezierPath bezierPath];
    self.layer = [CAShapeLayer layer];
    [self.view.layer addSublayer:self.layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)oneLine{
    [self.path removeAllPoints];
    [self.path moveToPoint:CGPointMake(self.bs, self.by)];

    float iv = self.mapScale;
    float tempT = 0.10 * self.currentTimeInSeconds/M_1_PI;
    float r = 30 * sinf(tempT/(10 * M_2_PI) ) ;

    for ( float i = 1 ; i < 720 ; i = i+ iv){

        float ex = r * ((2* cosf(i/M_2_PI + tempT )- cosf(2*(i/M_2_PI + tempT ))));
        float ey = r * ((2* sinf(i/M_2_PI + tempT )- sinf(2*(i/M_2_PI + tempT ))));
        
        float random = arc4random_uniform(7);
        float random2 = arc4random_uniform(5);
        
        [self.path addCurveToPoint: CGPointMake(ex+self.ox, ey+self.oy) controlPoint1: CGPointMake(random +self.ox, random2 +self.oy)  controlPoint2: CGPointMake(ex + self.ox, ey+ self.oy)];
    }

    self.layer.path = self.path.CGPath;
    self.layer.strokeColor = [UIColor blackColor].CGColor;
    self.layer.lineWidth = 0.5;
    self.layer.fillColor = nil;
}

-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    self.ox = panGestureRecognizer.view.frame.origin.x;
    self.oy = panGestureRecognizer.view.frame.origin.y;

    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    self.mapView.center = touchLocation;
    self.mapScale = [self mapFunction:self.ox :359 :10 :0 :50];
}

-(void)baseGesture:(UIPanGestureRecognizer*)basePan{
    self.bs = basePan.view.frame.origin.x;
    self.by = basePan.view.frame.origin.y;
    CGPoint baseLocation = [basePan locationInView:self.view];
    self.baseView.center = baseLocation;
}

-(float)mapFunction: (float) value :(float)low1 :(float)low2 :(float)high1 :(float)high2 {
    return low2 + (high2 - low2) * (value - low1) / (high1 - low1);
}

- (IBAction)timer:(NSTimer*)sender {
    [self creatTimer];
}

-(void)timerRun:(NSTimer *)timer{
    self.currentTimeInSeconds = self.currentTimeInSeconds + 0.05;
    
    if (self.currentTimeInSeconds == 50){
        self.currentTimeInSeconds = 0;
    }
    
    if(self.mapScale!=0){
        [self oneLine];
    }
}

-(NSTimer *)creatTimer{
    //interval change the how fast the time goes.
    return [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerRun:) userInfo:nil repeats:YES];
}

@end
