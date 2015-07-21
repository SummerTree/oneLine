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
    
    self.w = self.frame.size.width;
    self.h = self.frame.size.height;


    
    self.xB = self.w/2;
    self.yB = self.h/2;
    [self  tapMotion];
    self.bpoint = self.tapGestureRecognizer.view.frame.origin;


    self.xA = self.w/2;
    self.yA = self.h/2;
    self.aPoint = self.panGestureRecognizerCA.view.center;
    [self pointA];

    
    self.path = [UIBezierPath bezierPath];
    self.path.flatness = 0.1;
    
    self.player = [CAShapeLayer layer];
    [self.layer addSublayer:self.player];
    
    
    
    self.pathY = [UIBezierPath bezierPath];
    self.layerY = [CAShapeLayer layer];
    [self.layer addSublayer:self.layerY];

}

-(void)tapMotion{
    
    self.tapC = [[UIImageView alloc]initWithFrame:CGRectMake(self.w/2, self.h/5, 20, 20)];
    
    [self.tapC.layer setBorderColor: [UIColor yellowColor].CGColor ];
    self.tapC.layer.borderWidth = 1.0f;

    
    
    self.tapC.userInteractionEnabled = YES;
    self.tapGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tapC:)];
    //self.tapGestureRecognizer.numberOfTapsRequired = 1 ;
    self.tapGestureRecognizer.minimumPressDuration = 0.1;
    self.tapGestureRecognizer.allowableMovement = 60;
    [self.tapC addGestureRecognizer:self.tapGestureRecognizer];
    [self addSubview:self.tapC];
    
    //[self pointLine];
}

-(void)tapC:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    CGPoint location = [tapGestureRecognizer locationInView:self];
    self.tapC.center = location;
    
    self.bpoint = self.tapGestureRecognizer.view.frame.origin;
    [self pointLine];
    [self oneLine];
    
    if (self.tapGestureRecognizer.state == UIGestureRecognizerStateBegan)
    {
        

        if(self.timer){
            [self.timer invalidate];
            self.timer = nil;
        }
        else
            self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];

    }
    else if (self.tapGestureRecognizer.state == UIGestureRecognizerStateCancelled ||
             self.tapGestureRecognizer.state == UIGestureRecognizerStateFailed ||
             self.tapGestureRecognizer.state == UIGestureRecognizerStateEnded)
    {

    }
    
    
}


-(void)handleTimer:(NSTimer *)timer{
    //float a;
    self.a = self.a + 0.01;
    
    if ( self.a > 0.01){
        self.a = 0.005;
    }
    if (self.t >4) {
        self.t = 0.001;
    }
   // self.t  = self.t + 0.01;
    self.t  = self.t + self.a;

    [self pointLine];
    [self oneLine];
}



-(void)pointA{
    
    self.panGestureRecognizerCA = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panA:)];
    
    self.connectedA = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"o.png"]];
    self.connectedA.frame = CGRectMake(self.xA, self.yA, 40, 40);
    self.connectedA.userInteractionEnabled = true;
    
    [self.connectedA addGestureRecognizer:self.panGestureRecognizerCA];
    [self addSubview:self.connectedA];
    

}


-(void)panA:(UIPanGestureRecognizer *)panGestureRecognizer{
    
    CGPoint touchLocation = [panGestureRecognizer locationInView:self]; // self is a view not image Dbug
    
    self.connectedA.center = CGPointMake(touchLocation.x, touchLocation.y -15);
    //self.connectedA.center = touchLocation;
    
    self.aPoint = self.panGestureRecognizerCA.view.center;
    [self pointLine];


}



-(void)pointLine{
    

    [self.path removeAllPoints];
    
    [self.path moveToPoint: self.aPoint];
    //[self.path moveToPoint: CGPointMake(150, 300)];

    //float fquent = [ self mapFunction:self.aPoint.y :500 :-3 :800 :7];
    //float fquent = self.t;
    
    float fquentO = [ self mapFunction:self.aPoint.x :10 :2 :self.w :9];

    float back = [self mapFunction:self.bpoint.y :50 :-1.9 :self.h :1.9];
    float fquent = [self mapFunction:self.t :0.01 :10 :-3 :5];
    //NSLog(@"fquent = %f",self.t);
    float r = [self mapFunction:self.aPoint.y :self.h :0.1 :1:self.frame.size.width];
    //float r2 = [self mapFunction:self.bpoint.x :400 :1 :10 :20];
    //float r = 3;

    for (float j = 0.001 ; j < 5 ; j = j+2.2){
        //130
        float jx = (50*j) * (cosf(((j-back)/M_2_PI))- cosf(2*(j/M_2_PI)));
        float jy = (50*j) * (sinf(((j-back)/M_2_PI))- sinf(2*(j/M_2_PI)));
    
        //NSLog(@"j = %d--",(int)j);

        for (float i = 0.1 ; i < 7.2 ; i = i+0.09){
            
            //float random2 = arc4random_uniform(3);

            float ex = (r) * ((cosf(fquentO*(i/M_2_PI + j+i))- cosf(fquent*(i/M_2_PI ))));
            float ey = (r) * ((sinf(fquentO*(i/M_2_PI + i+j))- sinf(fquent*(i/M_2_PI ))));
            
            float  tx = self.bpoint.x - ex;
            float  ty = self.bpoint.y - ey;
            //NSLog(@"--i = %d",(int)i);

        
        [self.path addLineToPoint:CGPointMake(jx + 150 + tx, jy + 150 +ty)];
        
       }
    }

    

    self.player.path = self.path.CGPath;
    self.player.strokeColor = [UIColor whiteColor].CGColor;
    
    
    self.player.lineWidth = 0.25; //5
    self.player.fillColor = nil;

    
 }
     
-(float)mapFunction: (float) value :(float)low1 :(float)low2 :(float)high1 :(float)high2 {
    return low2 + (high2 - low2) * (value - low1) / (high1 - low1);
}


-(void)oneLine{
    
    float x = self.bpoint.x;
    float y = self.bpoint.y;
    
    [self.path removeAllPoints];
    [self.path moveToPoint:CGPointMake(self.bpoint.x, self.bpoint.y)];
    //[self.path moveToPoint:CGPointMake(passpontX.x,passpontX.y)];
    
    float mapScale = [self mapFunction:self.bpoint.x :359 :10 :10 :15];

    float iv = mapScale;
    
    float tempT = self.t;
    
    //float r = 20 * cosf(tempT/(10 * M_2_PI) ) ;
    float r =20;
    
    for ( float i = 1 ; i < 720 ; i = i+ iv){
        
        float ex = r * ((2* cosf((i/M_2_PI) + tempT )- cosf(2*((i/M_2_PI)))));
        float ey = r * ((2* sinf((i/M_2_PI) + tempT )- sinf(2*((i/M_2_PI)))));
        
        float random = arc4random_uniform(9);
        float random2 = arc4random_uniform(6);
        
        [self.path addCurveToPoint: CGPointMake(ex+x, ey+y) controlPoint1: CGPointMake(random + x, random2 +y)  controlPoint2: CGPointMake(ex + x, ey+y)];
        
        //self.connectedView.thridView.center = CGPointMake(ex+self.ox, ey+self.oy)  ;
        
        [self.path addLineToPoint:CGPointMake(ex + x +
                                              1, ey + y - 2)];
        
    }
    
    self.layerY.path = self.path.CGPath;
    self.layerY.strokeColor = [UIColor yellowColor].CGColor;
    
    self.layerY.lineWidth = 0.2;
    self.layerY.fillColor = nil;
    
}



@end
