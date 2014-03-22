//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by sudokita on 3/20/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //all initialize with clear bg color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    //find center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //circle will be the lasgest that willl fit in the view
    float maxRadius = (hypot(bounds.size.width, bounds.size.height) / 2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    //add arc that turns into a circle
    for(float currentRadius=maxRadius; currentRadius>0; currentRadius -=20)
    {
        [path moveToPoint:CGPointMake(center.x+currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:true];

    }
    
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    //draw line
    [path stroke];
    
    
    //Bronze challenge
    UIImage *image = [UIImage imageNamed:@"pingu.png"];
    
    //Gold challenge - drop shadow
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    
    //TRIANGLE DRAWING
    UIBezierPath * triangle = [[UIBezierPath alloc]init];
    
    CGPoint apex;
    apex.x = bounds.origin.x + bounds.size.width / 2.0;
    apex.y = 10;
    
    CGPoint leftBase;
    leftBase.x = 10;
    leftBase.y = rect.size.height - 30;
    
    CGPoint rightBase;
    rightBase.x = (bounds.origin.x + bounds.size.width)-10;
    rightBase.y = rect.size.height - 30;
    
    //draw Triangle
    [triangle moveToPoint:apex];
    [triangle addLineToPoint:leftBase];
    [triangle addLineToPoint:rightBase];
    [triangle addLineToPoint:apex];
    
    [triangle addClip];
    
    CGFloat locations[2] = {0.0, 1.0};
    CGFloat components[8] = {0.0, 1.0, 0.0, 1.0, //starting color: green
                            1.0, 1.0, 0.0, 1.0}; // ending color: yellow
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    
    CGPoint startPoint = CGPointMake(apex.x, apex.y);
    CGPoint endPoint = CGPointMake(leftBase.x, leftBase.y);
    
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    //END TRIANGLE DRAWING
    
    CGContextRestoreGState(currentContext);
    //drop shadow
    currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    
    [image drawInRect:rect];
    
    CGContextRestoreGState(currentContext);
    
}

@end
