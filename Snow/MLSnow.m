//
//  MLSnow.m
//  snow
//
//  Created by Maciej Lobodzinski on 29.12.2012.
//
//

#import "MLSnow.h"
#import "MLSnowfleake.h"

@implementation MLSnow

@synthesize snowflakesColor;
@synthesize snowingArea;

CCLayer *layer;

- (float)randomOpacity
{
    float randomOpacity = arc4random()/255.f;
    return randomOpacity;
}

- (void)createSnowflakes:(ccTime)dt
{
    MLSnowfleake *snowfleake = [[MLSnowfleake alloc] initWithSnowingArea:self.snowingArea];
    float x = arc4random() % (int)self.snowingArea.size.width + self.snowingArea.origin.x;
    float y = 200;//self.snowingArea.size.height-50;
    float snowfleakeSize = arc4random() % (int)30 + 20.f;
//    float time = arc4random() % 5 + 4;

    [snowfleake setSnowfleakeWithSize:snowfleakeSize position:ccp(0,0) andOpacity:1];
    [layer addChild:snowfleake.snowfleakeSprite z:50];
    
//    [snowfleake animateBouncingAnimationInTime:0.1 andWidth:50.f];
//    [snowfleake animateFallingDownInTime:time andHeight:self.snowingArea.size.height];
//    [snowfleake animateFadingAfterDelay:1 totalFadeTime:time andTargetOpacity:0];
//
//    [self runAction:[CCSequence actionOne:[CCDelayTime actionWithDuration:2*time+0.5f]
//                                            two:[CCCallBlock actionWithBlock:^(void){
//        [layer removeChild:snowfleake.snowfleakeSprite cleanup:YES];}]]];
}

- (id)initWithLayer:(CCLayer*)theLayer
{
    if( self = [super init] ) {
        layer = theLayer;
        self.snowflakesColor = ccc4(0, 0, 0, 255);
        self.snowingArea = CGRectMake(0, 0, [CCDirector sharedDirector].winSize.width, [CCDirector sharedDirector].winSize.height);
        
                self.snowingArea = CGRectMake(30, 30, 50, [CCDirector sharedDirector].winSize.height);
        
        MLSnowfleake *snowfleake = [[MLSnowfleake alloc] initWithSnowingArea:self.snowingArea];
        [snowfleake setSnowfleakeCicle];
        
        [self schedule:@selector(createSnowflakes:) interval:0.2f];
    }
    return self;
}

@end
