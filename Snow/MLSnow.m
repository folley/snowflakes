//
//  MLSnow.m
//  snow
//
//  Created by Maciej Lobodzinski on 29.12.2012.
//
//

#import "MLSnow.h"

@implementation MLSnow

@synthesize snowflakesColor;
@synthesize snowingArea;

- (float)randomOpacity
{
    float randomOpacity = arc4random();
    return randomOpacity/255;
}

- (void)createSnowflake
{
//    //CCSprite *snowflake = [CCSprite sprite]
//    glLineWidth(4);
//    CGPoint circleCenter = ccp(10,10);
//    drawCircle( circleCenter, 10, 0, 30, NO);
}

- (id)init
{
    if( self = [super init] ) {
        self.snowflakesColor = ccc4(255, 255, 255, 255); // white
        self.snowingArea = [CCDirector sharedDirector].winSize;
        [self createSnowflake];
    }
    return self;
}

@end
