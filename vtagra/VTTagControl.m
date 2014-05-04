//
//  VTTagView.m
//  vtagra
//
//  Created by Nikita Leonov on 5/3/14.
//  Copyright (c) 2014 vTagra. All rights reserved.
//

#import "VTTagControl.h"
#import "VTTagLocation.h"

@interface VTTagControl()
@property(nonatomic, strong) VTTagLocation *tagLocation;
@end

@implementation VTTagControl

- (instancetype)initWithVTTagLocation:(VTTagLocation *)tagLocation forScreenSize:(CGSize)screenSize
{
    CGFloat radius = 25;
    CGRect frame = (CGRect){(screenSize.width*tagLocation.x)-radius, (screenSize.height*tagLocation.y)-radius, 2*radius, 2*radius};
    self = [super initWithFrame:frame];
    if (self) {
        self.tagLocation = tagLocation;
        [self addCircleAnimation];
        
        self.userInteractionEnabled = YES;
        [self addTarget:self action:@selector(handleTagTap:) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

- (void)addCircleAnimation {
    CGFloat radius = self.frame.size.width/2;
    
    CAShapeLayer *circle = [CAShapeLayer layer];
    circle.fillColor = [UIColor clearColor].CGColor;
    circle.strokeColor = [UIColor whiteColor].CGColor;
    circle.lineWidth = 2;
    circle.bounds = (CGRect){0,0,self.frame.size};
    circle.path = [UIBezierPath bezierPathWithArcCenter:(CGPoint){2*radius, 2*radius} radius:radius startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
                        
    [self.layer addSublayer:circle];
    
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                     animations:(void (^)(void)) ^{
                         self.transform=CGAffineTransformMakeScale(1.25, 1.25);
                         self.alpha = 0.25;
                     }
                     completion:^(BOOL finished){
                         circle.strokeColor = [UIColor clearColor].CGColor;
                         [self performSelector:@selector(removeFromSuperview) withObject:self afterDelay:5];
                     }];
}

- (void)handleTagTap:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName: kTagLocationSelected object:self.tagLocation];
}

@end
