//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by sudokita on 3/20/14.
//  Copyright (c) 2014 Sudokita. All rights reserved.
//

#import "BNRHypnosisView.h"

//sticking this declraation in here simply localizes it. aww yis.
@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //all initialize with clear bg color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
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
    [self.circleColor setStroke];
    //draw line
    [path stroke];
}

//When a finger touches the screen, overriding the method:
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    //3 rand numbers
    float red = (arc4random()%100)/100.0;
    float green =  (arc4random()%100)/100.0;
    float blue =  (arc4random()%100)/100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
}

- (void) setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}
@end
