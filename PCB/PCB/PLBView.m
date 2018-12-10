//
//  PLBView.m
//  PCB
//
//  Created by sh-lx on 2018/12/10.
//  Copyright © 2018年 WangDan. All rights reserved.
//

#import "PLBView.h"

@interface PLBView()

@property (nonatomic,strong)CAShapeLayer *shapeLayer;

@end

@implementation PLBView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //创建路径
    UIBezierPath *rectPath = [UIBezierPath bezierPath];
    [rectPath moveToPoint:CGPointMake(self.bounds.size.height/2.0, self.bounds.size.height / 2.0)];
    [rectPath addLineToPoint:CGPointMake((self.bounds.size.width - self.bounds.size.height/2.0), self.bounds.size.height / 2.0)];
    rectPath.lineWidth = self.bounds.size.height;
    rectPath.lineCapStyle = kCGLineCapRound;//这个是终点类型
    [[UIColor grayColor] setStroke];
    [rectPath stroke];

//    //创建进度条Layer
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    self.shapeLayer = shapeLayer;
    shapeLayer.frame = self.bounds;
    shapeLayer.lineWidth = self.bounds.size.height;
    shapeLayer.strokeColor = [UIColor brownColor].CGColor;
    shapeLayer.strokeStart = 0.0;
    shapeLayer.strokeEnd   = 1;
    shapeLayer.lineCap     = kCALineCapRound;
    shapeLayer.path        = rectPath.CGPath;
    [self.layer addSublayer:shapeLayer];

    //创建渐变Layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.layer addSublayer:gradientLayer];
    gradientLayer.frame = self.bounds;
    NSArray *array1 = [NSArray arrayWithObjects:(id)[UIColor brownColor].CGColor,(id)[UIColor redColor].CGColor, nil];
    [gradientLayer setColors: array1];
    [gradientLayer setLocations:@[(@(0)),@(1)]];
    [gradientLayer setStartPoint:CGPointMake(0, 0)];
    [gradientLayer setEndPoint:CGPointMake(1, 0)];
    [gradientLayer setMask:self.shapeLayer];
    [self.layer addSublayer:gradientLayer];
    
}

- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    //这里需要判断新值和旧值
    [UIView animateWithDuration:2 animations:^{
        
        self.shapeLayer.strokeEnd = progressValue;
        
    }];
    
}


@end
