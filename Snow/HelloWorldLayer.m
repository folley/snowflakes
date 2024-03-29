//
//  HelloWorldLayer.m
//  Snow
//
//  Created by Maciej Lobodzinski on 29.12.2012.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


#import "HelloWorldLayer.h"
#import "MLSnow.h"
#import "MLSnowfleake.h"

@implementation HelloWorldLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	HelloWorldLayer *layer = [HelloWorldLayer node];
	[scene addChild: layer];
	return scene;
}

- (void)addBG
{
    CGSize size = [CCDirector sharedDirector].winSize;
    CCLayerColor *bg = [[CCLayerColor alloc] initWithColor:ccc4(0, 255, 255, 255)
                                                     width:size.width
                                                    height:size.height];
    bg.position = ccp(0,0);
    [self addChild:bg z:0];
}

-(id) init
{
	if( (self=[super init])) {
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp( size.width /2 , size.height/2 );
		[self addChild: label z:1];
        
        [self addBG];

        MLSnow *snow = [[MLSnow alloc] initWithLayer:self];
        snow.snowingArea = CGRectMake(0, 0, 10, 10);
        snow.snowflakesColor = ccc4(0, 0, 0, 255); 
        [self addChild:snow z:30];
    }
	return self;
}

- (void) dealloc
{
	[super dealloc];
}
@end
