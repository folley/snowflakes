//
//  MLSnowfleake.h
//  Snow
//
//  Created by Maciej Lobodzinski on 29.12.2012.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MLSnowfleake : CCSprite {
	ccColor4B snowfleakeColor;
    CCSprite *snowfleakeSprite;
    CGRect snowingArea;
}

- (id)initWithSnowingArea:(CGRect)theSnowingArea;
- (void)setSnowfleakeWithSize:(float)width position:(CGPoint)position andOpacity:(GLubyte)opacity;
- (void)animateBouncingAnimationInTime:(float)time andWidth:(float)width;
- (void)animateFallingDownInTime:(float)time andHeight:(float)height;
- (void)animateFadingAfterDelay:(float)delayTime totalFadeTime:(float)time andTargetOpacity:(GLubyte)opacity;
- (void)setSnowfleakeCicle;

@property ccColor4B snowfleakeColor;
@property (nonatomic, retain) CCSprite *snowfleakeSprite;
@property CGRect snowingArea;

@end