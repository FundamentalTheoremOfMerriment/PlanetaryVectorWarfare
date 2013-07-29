//
//  Functions.m
//  More Experimentation
//
//  Created by LEONG KO RIXIE TIFFANY on 17/7/13.
//  Copyright 2013 Tiffany Leong. All rights reserved.
//

#import "Functions.h"

@implementation Functions 

- (void) backToStart
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartingScreenLayer scene] ]];
}

@end
