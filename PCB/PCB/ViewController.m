//
//  ViewController.m
//  PCB
//
//  Created by sh-lx on 2018/12/7.
//  Copyright © 2018年 WangDan. All rights reserved.
//

#import "ViewController.h"
#import "PCBView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    PCBView *pcb = [[PCBView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:pcb];
    pcb.backgroundColor = self.view.backgroundColor;
    
}




@end
