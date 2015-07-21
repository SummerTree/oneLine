//
//  ConnectedLines.m
//  oneLine
//
//  Created by Aditya Narayan on 6/29/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//  add two guestures to a view will confuse the view. add guesture to the imageview, add mualible imageView to the View

#import "ConnectedLines.h"

@implementation ConnectedLines

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.


- (void)drawRect:(CGRect)rect {
    


//    self.xA = 200;
//    self.yA = 500;
//    [self pointA];

    


    self.xB = 200;
    self.yB = 400;
    [self pointB];
    
    //[self pointLine];
    
    self.path = [UIBezierPath bezierPath];
    self.path.flatness = 0.1;
    
    self.player = [CAShapeLayer layer];
    [self.layer addSublayer:self.player];
    
    [self pointLine];

    
    
    [self  tapMotion];

}

-(void)tapMotion{
    
    self.tapC = [[UIImageView alloc]initWithFrame:CGRectMake(300, 300, 10, 40)];
    self.tapC.backgroundColor = [UIColor blackColor];
    self.tapC.userInteractionEnabled = YES;
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapC:)];
    self.tapGestureRecognizer.numberOfTapsRequired = 1 ;
    
    [self.tapC addGestureRecognizer:self.tapGestureRecognizer];
    [self addSubview:self.tapC];
}

-(void)tapC:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    CGPoint location = [tapGestureRecognizer locationInView:self];
    self.tapC.center = location;
    
    self.path = [UIBezierPath bezierPath];
    self.player = [CAShapeLayer layer];
    [self.layer addSublayer:self.player];
    
    //[self.path moveToPoint: self.tapC.center];
    //[self.path addLineToPoint: self.moveLine];
    
    self.moveLine = CGPointMake(0,0);
    [self.path moveToPoint: self.tapC.center];

    
    [UIView animateWithDuration: 5.0 animations:^{
    
        self.tapC.alpha = 0.0;
        //self.tapC.frame = CGRectMake(300, 300, 10, 100);
       // self.tapC.center = CGPointMake(0, 0);
        
        self.moveLine = CGPointMake(0, 500);
        [self.path addLineToPoint:self.moveLine];

        self.x = 10;
        
    }];
    
    
    self.player.path = self.path.CGPath;
    self.player.strokeColor = [UIColor blueColor].CGColor;
    self.player.lineWidth = 0.5;
    self.player.fillColor = nil;
    
    
    
    
    // from here to the testing
    
    // end testing
}

-(void)pointA{
    
    self.panGestureRecognizerCA = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panA:)];
    
    self.connectedA = [[UIImageView alloc]initWithFrame:CGRectMake(self.xA, self.yA, 30, 30)];
    self.connectedA.backgroundColor = [UIColor orangeColor];
    self.connectedA.userInteractionEnabled = true;
    
    [self.connectedA addGestureRecognizer:self.panGestureRecognizerCA];
    [self addSubview:self.connectedA];
    

}


-(void)panA:(UIPanGestureRecognizer *)panGestureRecognizer{
    
    CGPoint touchLocation = [panGestureRecognizer locationInView:self]; // self is a view not image Dbug
    self.connectedA.center = touchLocation;
    
    //self.aPoint = self.panGestureRecognizerCA.view.frame.origin;


}


-(void)pointB{
    self.panGestureRecognizerCB = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panB:)];
    
    self.connectedB = [[UIImageView alloc]initWithFrame:CGRectMake(self.xB, self.yB, 30, 30)];
    self.connectedB.backgroundColor = [UIColor greenColor];
    self.connectedB.userInteractionEnabled = true;
    
    
    [self.connectedB addGestureRecognizer:self.panGestureRecognizerCB];
    
    [self addSubview:self.connectedB];

}

-(void)panB:(UIPanGestureRecognizer *)panGestureRecognizerCB{
    
    CGPoint touchLocation = [panGestureRecognizerCB locationInView:self]; // self is a view not image Dbug
    self.connectedB.center = touchLocation;

    self.bpoint = self.panGestureRecognizerCB.view.frame.origin;
    [self pointLine];


}

-(void)pointLine{
    
    
//    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
//    [bezierPath moveToPoint: CGPointMake(77.5, 36.5)];
//    [bezierPath addCurveToPoint: CGPointMake(101.5, 72.5) controlPoint1: CGPointMake(67.78, 56.83) controlPoint2: CGPointMake(75.76, 76.01)];
//    [bezierPath addCurveToPoint: CGPointMake(157.5, 66.5) controlPoint1: CGPointMake(127.24, 68.99) controlPoint2: CGPointMake(127.69, 97.13)];


    
    [self.path removeAllPoints];

    //CGPoint tempP = CGPointMake(300,300);
    //CGPoint tempP = self.thridView.center;
    
    
    /* working code
    
    
    float fquent = [ self mapFunction:self.bpoint.y :400 :0 :800 :15];
    float r = [ self mapFunction:self.bpoint.x :500 :0 :50 :50];
    
    for (float i = 0.1 ; i < 7.2 ; i = i+0.1){
        
        float ex = r * (cosf(i/M_2_PI )- cosf(fquent*(i/M_2_PI )));
        float ey = r * (sinf(i/M_2_PI )- sinf(fquent*(i/M_2_PI )));
        
        float  tx = self.aPoint.x - ex;
        float  ty = self.aPoint.y - ey;
        
        //float random2 = arc4random_uniform(5);
        //[self.path addLineToPoint:CGPointMake(tx, ty)];
        
        float jx = tx ;
        float jy = ty ;
        
        for (float j = 0.1 ; j < 5 ; j = j+0.1){
        
             jx = 20 * (cosf(j/M_2_PI ));
             jy = 20 * (sinf(j/M_2_PI ));

            
            
          [self.path addLineToPoint:CGPointMake(jx + self.aPoint.x, jy + self.aPoint.y)];

        }
    }
    
     // */
    
    //[self.path moveToPoint: self.aPoint];
    [self.path moveToPoint: CGPointMake(150, 300)];

    float fquent = [ self mapFunction:self.bpoint.y :400 :10 :800 :15];
    float r = [ self mapFunction:self.bpoint.x :500 :0 :50 :150];

    for (float j = 0.1 ; j < 3 ; j = j+0.2){
        
        float jx = 90 * (cosf((j/M_2_PI)));
        float jy = 90 * (sinf((j/M_2_PI)));
        
    
        for (float i = 0.1 ; i < 7.2 ; i = i+0.09){
            
            float ex = r * (cosf(i/M_2_PI )- cosf(fquent*(i/M_2_PI )));
            float ey = r * (sinf(i/M_2_PI )- sinf(fquent*(i/M_2_PI )));
            
            float  tx = self.aPoint.x - ex;
            float  ty = self.aPoint.y + ey;
            
            //float random2 = arc4random_uniform(5);
            //[self.path addLineToPoint:CGPointMake(tx, ty)];

        
        [self.path addLineToPoint:CGPointMake(jx + 150 + tx, jy + 300 +ty)];
        
       }
    }

    

    self.player.path = self.path.CGPath;
    self.player.strokeColor = [UIColor whiteColor].CGColor;
    
    
    self.player.lineWidth = 0.12; //5
    self.player.fillColor = nil;
    
//    NSArray * dashes = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:self.player.lineWidth *0], [NSNumber numberWithInt:self.player.lineWidth *5] , nil];
//    
//    [self.player setLineDashPattern:dashes];
//    [self.player setLineDashPhase:0];
//    self.player.lineCap = kCALineCapRound;
    
 }
     
-(float)mapFunction: (float) value :(float)low1 :(float)low2 :(float)high1 :(float)high2 {
    return low2 + (high2 - low2) * (value - low1) / (high1 - low1);
}

@end
