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
    
    
    UIPanGestureRecognizer *baseRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(baseGesture:)];
    [self.baseView addGestureRecognizer:baseRecognizer];
    
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveViewWithGestureRecognizer:)];
    [self.mapView addGestureRecognizer:panGestureRecognizer];
    
    
    self.path = [UIBezierPath bezierPath];
    self.layer = [CAShapeLayer layer];
    [self.view.layer addSublayer:self.layer];
    //[self oneLine];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)oneLine{
    
    //[self creatTimer];
    
    NSLog(@"count: %d", self.currentTimeInSeconds);

    [self.path removeAllPoints];

    [self.path moveToPoint:CGPointMake(self.bs, self.by)];
    //[self.path moveToPoint:CGPointMake(200,400)];

    //float iv = 3;

    float iv = self.mapScale;
  //  NSLog(@"fluidTimer = %f",self.fluidTimer);

    float tempT = 0.10 * self.currentTimeInSeconds/M_1_PI;
    
    float r = 30 * sinf(tempT/M_2_PI) ;
    
    for ( float i = 1 ; i < 720 ; i = i+ iv){

        float ex = r * ((2* cosf(i/M_2_PI + tempT )- cosf(2*(i/M_2_PI + tempT ))));
        float ey = r * ((2* sinf(i/M_2_PI + tempT )- sinf(2*(i/M_2_PI + tempT ))));

        
        [self.path addLineToPoint:CGPointMake(ex+ 200, ey+ self.oy)];

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
    NSLog(@" coordinate x = %f; y = %f ", panGestureRecognizer.view.frame.origin.x,panGestureRecognizer.view.frame.origin.y);
    self.mapScale = [self mapFunction:self.ox :359 :0 :0 :55];

    [self oneLine];

}

-(void)baseGesture:(UIPanGestureRecognizer*)basePan{
    self.bs = basePan.view.frame.origin.x;
    self.by = basePan.view.frame.origin.y;
    CGPoint baseLocation = [basePan locationInView:self.view];
    self.baseView.center = baseLocation;
    //[self oneLine];
}

-(float)mapFunction: (float) value :(float)low1 :(float)low2 :(float)high1 :(float)high2 {
        return low2 + (high2 - low2) * (value - low1) / (high1 - low1);
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
    
    if(self.mapScale!=0){
        [self oneLine];
    }

    NSLog(@"%d",self.currentTimeInSeconds);
}

-(NSTimer *)creatTimer{
    //interval change the how fast the time goes.
    return [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerRun:) userInfo:nil repeats:YES];
}




//-(void)tryGCD{
//    
//    dispatch_queue_t timeQueue = dispatch_queue_create("timeQueue", NULL);
//    
//    dispatch_async(timeQueue, ^{
//        //
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //
//        });
//        
//    });
//}


@end
