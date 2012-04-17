#import "UIView+Animations.h"


#pragma mark Class Definition

@implementation UIView (Animations)


#pragma mark -
#pragma mark Public Methods

+ (void)animateIf: (BOOL)condition 
	duration: (NSTimeInterval)duration 
	delay: (NSTimeInterval)delay 
	options: (UIViewAnimationOptions)options 
	animations: (void (^)(void))animations 
	completion: (void (^)(BOOL finished))completion
{
	if (condition == YES)
	{
		[UIView animateWithDuration: duration 
			delay: delay 
			options: options 
			animations: animations 
			completion: completion];
	}
	else
	{
		if (animations != nil)
		{
			animations();
		}
		
		if (completion != nil)
		{
			completion(NO);
		}
	}
}


@end // @implementation UIView (Animations)