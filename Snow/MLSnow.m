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
    MLSnowfleake *snowfleake = [MLSnowfleake new];
    float x = arc4random() % (int)self.snowingArea.size.width;
    float y = self.snowingArea.size.height+50;
    float snowfleakeSize = arc4random() % (int)50 + 20.f;
    float time = arc4random() % 5 + 4;
    
    NSLog(@"%f", snowfleakeSize);

    [snowfleake setSnowfleakeWithSize:snowfleakeSize position:ccp(x,y) andOpacity:[self randomOpacity]];
    [layer addChild:snowfleake.snowfleakeSprite z:50];
    
    [snowfleake animateBouncingAnimationInTime:1 andWidth:10.f];
    [snowfleake animateFallingDownInTime:time andHeight:self.snowingArea.size.height+200];
    [snowfleake animateFadingAfterDelay:1 totalFadeTime:time andTargetOpacity:0];
    
    [self runAction:[CCSequence actionOne:[CCDelayTime actionWithDuration:time+0.5f]
                                            two:[CCCallBlock actionWithBlock:^(void){
        [layer removeChild:snowfleake.snowfleakeSprite cleanup:YES];}]]];
    
    snowfleake.snowfleakeSprite.scale = 20/snowfleakeSize;

}

- (id)initWithLayer:(CCLayer*)theLayer
{
    if( self = [super init] ) {
        layer = theLayer;
        self.snowflakesColor = ccc4(0, 0, 0, 255);
        self.snowingArea = CGRectMake(-50, -50, [CCDirector sharedDirector].winSize.width+100, [CCDirector sharedDirector].winSize.height+100);
        [self schedule:@selector(createSnowflakes:) interval:0.2f];
    }
    return self;
}

@end
