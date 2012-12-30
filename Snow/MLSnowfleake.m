//
//  MLSnowfleake.m
//  Snow
//
//  Created by Maciej Lobodzinski on 29.12.2012.
//
//

#import "MLSnowfleake.h"

@implementation MLSnowfleake

@synthesize snowfleakeColor;
@synthesize snowfleakeSprite;
@synthesize snowingArea;

- (id)initWithSnowingArea:(CGRect)theSnowingArea
{
    if (self = [super init]) {
        self.snowingArea = theSnowingArea;
    }
    return self;
}

- (void)setSnowfleakeCicle
{
    NSLog(@"123");
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    UIGraphicsBeginImageContextWithOptions(self.snowingArea.size, NO, [[UIScreen mainScreen] scale]);
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(0,0,30,30));
    
    CGContextDrawPath(context,kCGPathStroke);
    
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [[CCTextureCache sharedTextureCache] addCGImage:[finalImage CGImage] forKey:@"circleKey"];
}

- (void)setSnowfleakeWithSize:(float)width position:(CGPoint)position andOpacity:(GLubyte)opacity
{
    CCSprite *circle = [CCSprite spriteWithTexture:[[CCTextureCache sharedTextureCache] textureForKey:@"circleKey"]];
    
    self.snowfleakeSprite = circle;
    self.snowfleakeSprite.position = ccp(0,0);
    //self.snowfleakeSprite.scale = 20/width;
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
    CCMoveBy *fallDown = [CCMoveBy actionWithDuration:time*2 position:ccp(0,-2*height)];
    [self.snowfleakeSprite runAction:fallDown];
}

- (void)animateBouncingAnimationInTime:(float)time andWidth:(float)width
{
    CCMoveBy *bounceRight = [CCMoveBy actionWithDuration:0.1 position:ccp(20,0)];
    CCMoveBy *bounceLeft = [CCMoveBy actionWithDuration:0.1 position:ccp(-20,0)];
    
    CCRepeatForever *animation = [CCRepeatForever actionWithAction:[CCSequence actionOne:bounceRight two:bounceLeft]];
    [self.snowfleakeSprite runAction:animation];
}

@end