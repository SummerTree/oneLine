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

}

-(void)viewDidAppear:(BOOL)animated{
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
