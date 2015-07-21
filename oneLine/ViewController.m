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
 
    
    
    //UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    //[self.mapView addGestureRecognizer:panGestureRecognizer];
    
    
//    UIPanGestureRecognizer *baseRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(baseGesture:)];
//    [self.baseView addGestureRecognizer:baseRecognizer];
//    
//    self.bs = self.baseView.frame.origin.x;
//    self.by = self.baseView.frame.origin.y;
    
    //self.connectedView.thridView = self.baseView;
    
    
    self.path = [UIBezierPath bezierPath];
    self.layer = [CAShapeLayer layer];
    [self.view.layer addSublayer:self.layer];
    

    
}

-(void)viewDidAppear:(BOOL)animated{
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
/*
-(void)oneLine{
    
    //CGPoint passpontX = self.passPoint.bpoint;

    
    NSLog(@"countTime: %f", self.currentTimeInSeconds);

    [self.path removeAllPoints];
    [self.path moveToPoint:CGPointMake(self.ox, self.oy)];
    //[self.path moveToPoint:CGPointMake(passpontX.x,passpontX.y)];

    
    float iv = self.mapScale;

    float tempT = 0.10 * self.currentTimeInSeconds/M_1_PI;
    
    float r = 30 * cosf(tempT/(10 * M_2_PI) ) ;


    for ( float i = 1 ; i < 720 ; i = i+ iv){

        float ex = r * ((2* cosf(i/M_2_PI + tempT )- cosf(2*(i/M_2_PI + tempT ))));
        float ey = r * ((2* sinf(i/M_2_PI + tempT )- sinf(2*(i/M_2_PI + tempT ))));
        
        float random = arc4random_uniform(7);
        float random2 = arc4random_uniform(5);
        
        [self.path addCurveToPoint: CGPointMake(ex+self.ox, ey+self.oy) controlPoint1: CGPointMake(random +self.ox, random2 +self.oy)  controlPoint2: CGPointMake(ex + self.ox, ey+ self.oy)];

        //self.connectedView.thridView.center = CGPointMake(ex+self.ox, ey+self.oy)  ;

        [self.path addLineToPoint:CGPointMake(ex + self.ox, ey+ self.oy)];

    }

    self.layer.path = self.path.CGPath;
    self.layer.strokeColor = [UIColor yellowColor].CGColor;
    self.layer.lineWidth = 0.2;
    self.layer.fillColor = nil;

}

-(void)moveViewWithGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    self.mapView.center = touchLocation;

    self.ox = panGestureRecognizer.view.frame.origin.x;
    self.oy = panGestureRecognizer.view.frame.origin.y;

    
    //self.mapView.center = CGPointMake(self.ox, self.oy);
    
    NSLog(@" coordinate x = %f; y = %f ", panGestureRecognizer.view.frame.origin.x,panGestureRecognizer.view.frame.origin.y);
    self.mapScale = [self mapFunction:self.ox :359 :10 :10 :15];

}

-(void)baseGesture:(UIPanGestureRecognizer*)basePan{
    self.bs = basePan.view.frame.origin.x;
    self.by = basePan.view.frame.origin.y;
    CGPoint baseLocation = [basePan locationInView:self.view];
    self.baseView.center = baseLocation;
}

-(float)mapFunction: (float) value :(float)low1 :(float)low2 :(float)high1 :(float)high2 {
        return low2 + (high2 - low2) * (value - low1)  / (high1 - low1);
}



- (IBAction)timer:(NSTimer*)sender {

    [self creatTimer];

}

-(void)timerRun:(NSTimer *)timer{
    //self.currentTimeInSeconds++;
    self.currentTimeInSeconds = self.currentTimeInSeconds + 0.05;
    //self.fluidTimer = self.currentTimeInSeconds / 10;
    
    if (self.currentTimeInSeconds == 50){
        self.currentTimeInSeconds = 0;
    }
    
    
    if(self.mapScale==0){

        self.ox = self.baseView.frame.origin.x;
        self.oy = self.baseView.frame.origin.y;
        self.mapScale = [self mapFunction:self.ox :359 :10 :10 :15];

    }
    [self oneLine];

    NSLog(@"%f",self.currentTimeInSeconds);
}

-(NSTimer *)creatTimer{
    //interval change the how fast the time goes.
    return [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerRun:) userInfo:nil repeats:YES];
}


- (IBAction)k:(id)sender {
}*/

@end
