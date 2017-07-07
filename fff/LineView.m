//
//  LineView.m
//  fff
//
//  Created by mac on 2017/7/7.
//  Copyright © 2017年 zrgg. All rights reserved.
//

#import "LineView.h"

@implementation LineView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineWidth(context, 1);  //线宽
    CGContextSetAllowsAntialiasing(context, true);
//    CGContextSetRGBStrokeColor(context, 0 / 255.0, 0 / 255.0, 0 / 255.0, 1.0);  //线的颜色
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextBeginPath(context);
    
    CGContextMoveToPoint(context, _startPoint.x, _startPoint.y);  //起点坐标
    NSLog(@"起点坐标x:%f，y:%f",_startPoint.x,_startPoint.y);
    CGContextAddLineToPoint(context, _endPoint.x, _endPoint.y);   //终点坐标
    
    CGContextStrokePath(context);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
