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

@property (nonatomic,strong)CAGradientLayer *gradientlayer;

@end

@implementation PCBView


- (void)drawRect:(CGRect)rect {
    
    //创建贝塞尔曲线化圆
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0) radius:(self.bounds.size.width - 20)/2.0 startAngle:M_PI_2 + M_PI_4  endAngle:2 * M_PI + M_PI_4 clockwise:YES];
    
    //设置颜色
    [[UIColor grayColor] set];
    
    //线条粗细
    circlePath.lineWidth = 20;
    
    //终点类型
    circlePath.lineCapStyle = kCGLineCapRound;
    
    //开始绘图
    [circlePath stroke];
    
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
    
    self.gradientlayer = [CAGradientLayer layer];
    //渐变layer
    CAGradientLayer *leftGradientlayer = [CAGradientLayer layer];

    leftGradientlayer.frame = CGRectMake(0, 0, self.bounds.size.width/2.0, self.bounds.size.height);
    NSArray *arrayL = [NSArray arrayWithObjects:(id)[UIColor yellowColor].CGColor,(id)[UIColor orangeColor].CGColor, nil];
    [leftGradientlayer setColors: arrayL];
    [leftGradientlayer setLocations:@[(@(0)),@(0.9)]];
    [leftGradientlayer setStartPoint:CGPointMake(0, 1)];
    [leftGradientlayer setEndPoint:CGPointMake(0, 0)];
    [self.gradientlayer addSublayer:leftGradientlayer];
    
    //渐变layer
    CAGradientLayer *rightGradientlayer = [CAGradientLayer layer];
    rightGradientlayer.frame = CGRectMake(self.bounds.size.width / 2.0, 0, self.bounds.size.width / 2.0, self.bounds.size.height);
    NSArray *array1 = [NSArray arrayWithObjects:(id)[UIColor orangeColor].CGColor,(id)[UIColor redColor].CGColor, nil];
    [rightGradientlayer setColors: array1];
    [rightGradientlayer setLocations:@[(@(0.1)),@(1)]];
    [rightGradientlayer setStartPoint:CGPointMake(0.5, 0)];
    [rightGradientlayer setEndPoint:CGPointMake(0.5, 1)];
    [self.gradientlayer addSublayer:rightGradientlayer];
    [self.layer addSublayer:self.gradientlayer];
    [self.gradientlayer setMask:self.shapeLayer];
    
}



- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    //这里需要判断新值和旧值
    [UIView animateWithDuration:2 animations:^{
       
        self.shapeLayer.strokeEnd = progressValue;
        
    }];
    
}


@end
