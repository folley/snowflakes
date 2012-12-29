//
//  MLSnowfleake.m
//  Snow
//
//  Created by Maciej Lobodzinski on 29.12.2012.
//
//

#import "MLSnowfleake.h"

@implementation MLSnowfleake

@synthesize radius;
@synthesize segments;
@synthesize isAnimating;
@synthesize isFading;
@synthesize snowfleakeColor;
@synthesize snowfleakeSprite;

- (void)setSnowfleakeWithSize:(float)width position:(CGPoint)position andOpacity:(GLubyte)opacity
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    UIGraphicsBeginImageContextWithOptions(screenSize, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetAlpha(context, opacity);
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(170,0,width,width));
    
    CGContextDrawPath(context,kCGPathStroke);

    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [[CCTextureCache sharedTextureCache] addCGImage:[finalImage CGImage] forKey:@"circleKey"];
    
    CCSprite *circle = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"circleKey"]];
    self.snowfleakeSprite = circle;
    self.snowfleakeSprite.position = position;
}


#pragma mark- animations
- (void)animateFadingAfterDelay:(float)delayTime totalFadeTime:(float)time andTargetOpacity:(GLubyte)opacity
{
    CCDelayTime *delay = [CCDelayTime actionWithDuration:delayTime];
    CCFadeTo *fading = [CCFadeTo actionWithDuration:time opacity:opacity];
    
    CCSequence *fadingAnimation = [CCSequence actionOne:delay two:fading];
    [self.snowfleakeSprite runAction:fadingAnimation];
}

- (void)animateFallingDownInTime:(float)time andHeight:(float)height
{
    CCMoveBy *fallDown = [CCMoveBy actionWithDuration:time position:ccp(0, -height-50)];
    [self.snowfleakeSprite runAction:fallDown];
}

- (void)animateBouncingAnimationInTime:(float)time andWidth:(float)width
{
    CCMoveBy *bounceRight = [CCMoveBy actionWithDuration:time position:ccp(width,0)];
    CCMoveBy *bounceLeft = [CCMoveBy actionWithDuration:time position:ccp(-width,0)];
    
    CCRepeatForever *animation = [CCRepeatForever actionWithAction:[CCSequence actionOne:bounceRight two:bounceLeft]];
    [self.snowfleakeSprite runAction:animation];
}

@end