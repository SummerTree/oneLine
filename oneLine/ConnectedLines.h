//
//  ConnectedLines.h
//  oneLine
//
//  Created by Aditya Narayan on 6/29/15.
//  Copyright (c) 2015 Guang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectedLines : UIView

@property (strong, nonatomic) UIScreen* mainUI;
@property CGFloat w;
@property CGFloat h;

@property ( strong, nonatomic) UIImageView * connectedA;
@property ( strong, nonatomic) UIImageView * connectedB;
@property ( strong, nonatomic) UIPanGestureRecognizer * panGestureRecognizerCA;
@property ( strong, nonatomic) UIPanGestureRecognizer * panGestureRecognizerCB;

@property (strong, nonatomic) UIImageView * tapC;
@property (nonatomic, strong) NSTimer *timer;
@property float a;
@property float t;
@property ( strong, nonatomic) UILongPressGestureRecognizer * tapGestureRecognizer;

//@property float x;
//@property CGPoint moveLine;

@property float xA;
@property float yA;
@property CGPoint aPoint;
//@property float y2A;

@property float xB;
@property float yB;

@property CGPoint bpoint;
@property CGPoint thirdPoint;

//@property float y2B;

@property (strong, nonatomic)UIBezierPath * path;
@property (strong, nonatomic)CAShapeLayer * player;
@property (strong, nonatomic)UIView * thridView;


@property (strong,nonatomic)UIBezierPath * pathY;
@property (strong,nonatomic)CAShapeLayer * layerY;

@end
