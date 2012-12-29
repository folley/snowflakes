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

- (float)randomOpacityFromRange:(float)startPoint andEndPoint:(float)endPoint
{
    float randomOpacity = arc4random() + startPoint;
    return randomOpacity;
}

- (void)createSnowflakes
{
    MLSnowfleake *snowfleake = [MLSnowfleake new];
    float x = arc4random() % (int)self.snowingArea.size.width;
    float y = self.snowingArea.size.height;
    
    x=100;
    y=100;
    [snowfleake setSnowfleakeWithSize:CGSizeMake(20, 20) position:ccp(x,y) andOpacity:100/255.f];
    [self addChild:snowfleake z:50];
    NSLog(@"123");
}

- (id)init
{
    if( self = [super init] ) {
        self.snowflakesColor = ccc4(255, 255, 255, 255);
        self.snowingArea = CGRectMake(0, 0, [CCDirector sharedDirector].winSize.width, [CCDirector sharedDirector].winSize.height);
        [self schedule:@selector(createSnowflakes) interval:0.1f];
    }
    return self;
}

@end
