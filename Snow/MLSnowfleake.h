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
	float radius;
	int segments;
	ccColor4B snowfleakeColor;
    BOOL isAnimating;
    BOOL isFading;
    CCSprite *snowfleakeSprite;
}

- (CCSprite*)setSnowfleakeWithSize:(CGSize)size position:(CGPoint)position andOpacity:(GLubyte)opacity;
- (void)animateBouncingAnimationInTime:(float)time andWidth:(float)width;
- (void)animateFallingDownInTime:(float)time andHeight:(float)height;
- (void)animateFadingAfterDelay:(float)delayTime totalFadeTime:(float)time andTargetOpacity:(GLubyte)opacity;

@property float radius;
@property int segments;
@property BOOL isAnimating;
@property BOOL isFading;
@property ccColor4B snowfleakeColor;
@property (nonatomic, retain) CCSprite *snowfleakeSprite;

@end