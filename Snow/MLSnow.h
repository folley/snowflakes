//
//  MLSnow.h
//  snow
//
//  Created by Maciej Lobodzinski on 29.12.2012.
//
//

#import "CCSprite.h"
#import "cocos2d.h"

@interface MLSnow : CCSprite

@property ccColor4B snowflakesColor;
@property CGRect snowingArea;

- (id)initWithLayer:(CCLayer*)theLayer;

@end
