//
//  StartingScreenLayer.m
//  More Experimentation
//
//  Created by LEONG KO RIXIE TIFFANY on 15/7/13.
//  Copyright Tiffany Leong 2013. All rights reserved.
//


// Import the interfaces
#import "StartingScreenLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#import "PlanetSelectLayer.h"
#import "OptionsLayer.h"

#pragma mark - StartingScreenLayer

bool firstTime = TRUE;

// StartingScreenLayer implementation
@implementation StartingScreenLayer

// Helper class method that creates a Scene with the StartingScreenLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StartingScreenLayer *layer = [StartingScreenLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Planetary Vector Warfare" fontName:@"Marker Felt" fontSize:40];
        label.color=ccc3(0, 0, 0);

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// to avoid a retain-cycle with the menuitem and blocks
		
		// To be replaced with an image
		CCMenuItem *start = [CCMenuItemFont itemWithString:@"Start" block:^(id sender) {
			if (firstTime == TRUE) {
                firstTime = FALSE;
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[PlanetSelectLayer scene] ]];
            } else if (firstTime == FALSE) {
                [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[OptionsLayer scene] ]];
            }
		}];
		
		// Leaderboard Menu Item using blocks
		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Options" block:^(id sender) {
			
			
			[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[OptionsLayer scene] ]];
		}];

		
		CCMenu *menu = [CCMenu menuWithItems:start, itemLeaderboard, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];

	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end
