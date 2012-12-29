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

- (id)init
{
    if( self = [super init] ) {
        self.snowfleakeColor = ccc4(255, 255, 255, 255);
    }
    return self;
}

- (CCSprite*)setSnowfleakeWithSize:(CGSize)size position:(CGPoint)position andOpacity:(GLubyte)opacity
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    UIGraphicsBeginImageContextWithOptions(screenSize, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetAlpha(context, opacity);
    CGContextFillEllipseInRect(context, CGRectMake(170,0,50,50));
    CGContextDrawPath(context,kCGPathStroke);
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //[[CCTextureCache sharedTextureCache] addCGImage:[finalImage CGImage] forKey:@"circleKey"];
    
    CCSprite *circle = [CCSprite spriteWithTexture:[finalImage CGImage] ];
    self.snowfleakeSprite = circle;
    self.snowfleakeSprite.position = position;
}


#pragma mark- animations
- (void)animateFadingAfterDelay:(float)delayTime totalFadeTime:(float)time andTargetOpacity:(GLubyte)opacity
{
    CCAction *delay = [CCDelayTime actionWithDuration:delayTime];
    CCAction *fading = [CCFadeTo actionWithDuration:time opacity:opacity];
    
    CCAction *fadingAnimation = [CCSequence actionOne:delay two:fading];
    [self runAction:fadingAnimation];
}

- (void)animateFallingDownInTime:(float)time andHeight:(float)height
{
    CCAction *fallDown = [CCMoveBy actionWithDuration:time position:ccp(0, -height)];
    [self runAction:fallDown];
}

- (void)animateBouncingAnimationInTime:(float)time andWidth:(float)width
{
    CCAction *bounceRight = [CCMoveBy actionWithDuration:time position:ccp(width,0)];
    CCAction *bounceLeft = [CCMoveBy actionWithDuration:time position:ccp(-width,0)];
    
    CCAction *animation = [CCRepeatForever actionWithAction:[CCSequence actionOne:bounceRight two:bounceLeft]];
    [self runAction:animation];
}

@end