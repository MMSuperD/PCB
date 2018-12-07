//
//  PCBView.m
//  PCB
//
//  Created by sh-lx on 2018/12/7.
//  Copyright © 2018年 WangDan. All rights reserved.
//

#import "PCBView.h"

@interface PCBView()

@property (nonatomic,strong)CAShapeLayer *shapeLayer;

@end

@implementation PCBView


- (void)drawRect:(CGRect)rect {
    
    //创建贝塞尔曲线化圆
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0) radius:(self.bounds.size.width - 20)/2.0 startAngle:M_PI_2 + M_PI_4  endAngle:2 * M_PI + M_PI_4 clockwise:YES];
    
    //设置颜色
    [[UIColor blueColor] set];
    
    //线条粗细
    circlePath.lineWidth = 10;
    
    //开始绘图
    [circlePath stroke];
    
    
    //画layer
    
    CAShapeLayer *bgLayer = [CAShapeLayer layer];
    bgLayer.frame = self.bounds;
    bgLayer.fillColor = [UIColor clearColor].CGColor;
    bgLayer.lineWidth = 20;
    bgLayer.strokeColor = [UIColor brownColor].CGColor;
    bgLayer.strokeStart = 0;
    bgLayer.strokeEnd   = 1;
    bgLayer.lineCap     = kCALineCapRound;
    bgLayer.path        = circlePath.CGPath;
    
    [self.layer addSublayer:bgLayer];
    
    //进度shapelayer
   CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    self.shapeLayer = shapeLayer;
    shapeLayer.frame = self.bounds;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 20;
    shapeLayer.lineCap   = kCALineCapRound;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd   = 0.7;
    shapeLayer.path = circlePath.CGPath;
    [self.layer addSublayer:self.shapeLayer];
    
    //渐变layer
    CAGradientLayer *leftGradientlayer = [CAGradientLayer layer];
    
    leftGradientlayer.frame = CGRectMake(0, 0, self.bounds.size.width / 2.0, self.bounds.size.height);
    NSArray *array = [NSArray arrayWithObjects:(id)[UIColor yellowColor].CGColor,(id)[UIColor purpleColor].CGColor, nil];
    [leftGradientlayer setColors: array];
    
    [leftGradientlayer setLocations:@[(@(0)),@(0.5)]];
    
    [leftGradientlayer setStartPoint:CGPointMake(0, 1)];
    [leftGradientlayer setEndPoint:CGPointMake(0, 0)];
    
    [self.layer addSublayer:leftGradientlayer];
}


@end
