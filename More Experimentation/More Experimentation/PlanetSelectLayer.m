//
//  PlanetSelectLayer.m
//  More Experimentation
//
//  Created by LEONG KO RIXIE TIFFANY on 15/7/13.
//  Copyright Tiffany Leong 2013. All rights reserved.
//


// Import the interfaces
#import "PlanetSelectLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
#import "StartingScreenLayer.h"

#pragma mark - PlanetSelectLayer

// PlanetSelectLayer implementation
@implementation PlanetSelectLayer

// Helper class method that creates a Scene with the PlanetSelectLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	PlanetSelectLayer *layer = [PlanetSelectLayer node];
	
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
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Planet Select" fontName:@"Marker Felt" fontSize:64];
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// to avoid a retain-cycle with the menuitem and blocks
		
        /*CCSprite *rect = [CCSprite node];
        [rect setTextureRect:CGRectMake(0, 0, 200, 200)];
        [rect setColor:ccBLACK];*/
        
		// Achievement Menu Item using blocks
		CCMenuItemImage *sphere = [CCMenuItemImage itemWithNormalImage:@"Circle.png"
                                    selectedImage: @"Circle.png"
                                    target:self
                                    selector:@selector (back:)];
        [sphere runAction:[CCScaleTo actionWithDuration:0.05 scale:2.5]];
        [sphere setPosition:ccp(-350, size.height-400)];

        CCMenuItemImage *cube = [CCMenuItemImage itemWithNormalImage: @"Square.jpg"
                                selectedImage: @"Square.jpg"
                                target:self
                                selector:@selector (back:)];
        [cube runAction:[CCScaleTo actionWithDuration:0.05 scale:0.4]];
        [cube setPosition:ccp(0, size.height-400)];
		
		CCMenuItemImage *tetrahedron = [CCMenuItemImage itemWithNormalImage:@"Triangle.png"
                                       selectedImage: @"Triangle.png"
                                       target:self
                                       selector:@selector (back:)];
        [tetrahedron runAction:[CCScaleTo actionWithDuration:0.05 scale:0.5]];
        [tetrahedron setPosition:ccp(350, size.height-400)];
        
		
		CCMenu *planetSelect  = [CCMenu menuWithItems:sphere, cube, tetrahedron, nil];
		
		/*[planetSelect alignItemsHorizontallyWithPadding:10];
		[planetSelect setPosition:ccp( size.width/2, size.height/2)];*/
        [self runAction:[CCScaleTo actionWithDuration:0.05 scale:0.5]];
		
		// Add the menu to the layer
		[self addChild:planetSelect];
        
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

-(void) back
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StartingScreenLayer scene] ]];
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