//
//  SplashScreenLayer.m
//  More Experimentation
//
//  Created by LEONG KO RIXIE TIFFANY on 15/7/13.
//  Copyright Tiffany Leong 2013. All rights reserved.
//


// Import the interfaces
#include "Functions.h"

#pragma mark - SplashScreenLayer

// StartingScreenLayer implementation
@implementation SplashScreenLayer

// Helper class method that creates a Scene with the StartingScreenLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	SplashScreenLayer *layer = [SplashScreenLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(id) init
{
	if( (self=[super init])) {
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        //Declares a pointer to the backqround
		CCSprite *background;
		
        //If it is an iphone...
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
            
            //Edit the .png file to the iPhone
			background = [CCSprite spriteWithFile:@"Default.png"];
            
            //To rotate the image in the case of fails.
			background.rotation = 90;
		} else {
            //This is the ipad one.
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
        
        //Give it its position
		background.position = ccp(size.width/2, size.height/2);

		// add the label as a child to this Layer
		[self addChild: background];
	}
	
	return self;
}

-(void) onEnter
{
	[super onEnter];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartingScreenLayer scene] ]];
}
@end
