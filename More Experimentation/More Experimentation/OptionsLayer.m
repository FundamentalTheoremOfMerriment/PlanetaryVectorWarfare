//
//  OptionsLayer.m
//  More Experimentation
//
//  Created by LEONG KO RIXIE TIFFANY on 15/7/13.
//  Copyright Tiffany Leong 2013. All rights reserved.
//


// Import the interfaces
#import "OptionsLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "StartingScreenLayer.h"

#pragma mark - OptionsLayer

// OptionsLayer implementation
@implementation OptionsLayer

// Helper class method that creates a Scene with the OptionsLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	OptionsLayer *layer = [OptionsLayer node];
	
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
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Options" fontName:@"American Typewriter" fontSize:64 ];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height-50 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		
		// Achievement Menu Item using blocks
		CCMenuItem *back = [CCMenuItemFont itemWithString:@"Back" block:^(id sender) {
			
			[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartingScreenLayer scene] ]];
		}];
		
		// Leaderboard Menu Item using blocks
		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
			
			
		}];
        
		
		CCMenu *options = [CCMenu menuWithItems:back, itemLeaderboard, nil];
		
		[options alignItemsHorizontallyWithPadding:20];
		[options setPosition:ccp( size.width/2, 50)];
		
		// Add the optionsto the layer
		[self addChild:options];
        
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