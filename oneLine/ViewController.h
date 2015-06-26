//
//  ViewController.h
//  oneLine
//
//  Created by Aditya Narayan on 6/24/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic)UIBezierPath * path;
@property (strong,nonatomic)CAShapeLayer * layer;

//- (IBAction)map:(UIPanGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *mapView;
@property (strong, nonatomic) IBOutlet UIImageView *baseView;
- (IBAction)timer:(NSTimer *)timer;

@property float mapScale;
@property float ox;
@property float oy;

@property float bs;
@property float by;

@property (weak, nonatomic)NSTimer *myTimer;
@property float currentTimeInSeconds;
@property float fluidTimer;


@end

