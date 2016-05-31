//
//  HeartView.m
//  DrawHeart
//
//  Created by 钱锐博 on 16/5/31.
//  Copyright © 2016年 TurboRun. All rights reserved.
//

#import "HeartView.h"

@interface HeartView ()

@property (nonatomic ,assign)CGFloat t;

@end

@implementation HeartView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect {
    
    CGFloat endAngle = M_PI_4;
    CGFloat radius = MIN(self.bounds.size.width / 4, self.bounds.size.height / 3);
    CGPoint center1 = CGPointMake(self.bounds.size.width * 0.5 + radius, self.bounds.size.height / 3);
    CGPoint center2 = CGPointMake(self.bounds.size.width * 0.5 - radius, self.bounds.size.height / 3);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center1 radius:radius startAngle:M_PI endAngle:endAngle clockwise:1];
    
    [path addLineToPoint:CGPointMake(center1.x - radius, center1.y + 2 * radius / tan(endAngle))];
    
    [path addArcWithCenter:center2 radius:radius startAngle:M_PI - endAngle endAngle:0 clockwise:1];
    
    [path addClip];
    [path setLineWidth:2];
    [path setLineCapStyle:kCGLineCapRound];
    
    [path stroke];
    
    //wave
    CGPoint zero = CGPointMake(0, self.bounds.size.height * (1-_value));
    UIBezierPath *wave = [UIBezierPath bezierPath];
    [wave moveToPoint:zero];
    for (int i = 0; i < self.bounds.size.width; i++) {
        CGPoint p = relativeCoor(zero, i, 3*sin(M_PI /50 *i + _t ) );
        [wave addLineToPoint:p];
    }
    [wave addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)];
    [wave addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [[UIColor redColor]set];
    [wave fill];
}

- (void)didMoveToSuperview {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(change) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)change {
    _t += M_PI * 0.02;
    if (_t == M_PI * 2) {
        _t = 0;
    }
    [self setNeedsDisplay];
}

CGPoint relativeCoor(CGPoint point, CGFloat x ,CGFloat y) {
    return CGPointMake(point.x + x, point.y + y);
}

@end
