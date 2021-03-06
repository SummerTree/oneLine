//
//  ViewController.h
//  oneLine
//
//  Created by Aditya Narayan on 6/24/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Draw2D.h"
#import "ConnectedLines.h"

@interface ViewController : UIViewController

@property (strong,nonatomic)UIBezierPath * path;
@property (strong,nonatomic)CAShapeLayer * layer;
@property (strong, nonatomic) IBOutlet UIImageView *mapView;
@property (strong, nonatomic) IBOutlet UIImageView *baseView;

@property float mapScale;
@property float ox;
@property float oy;

@property float bs;
@property float by;

//@property (weak, nonatomic)NSTimer *myTimer;
//@property float currentTimeInSeconds;
//@property float fluidTimer;

@property (strong, nonatomic) ConnectedLines * passPoint;

@property (strong, nonatomic) IBOutlet ConnectedLines *connectedView;



@end

