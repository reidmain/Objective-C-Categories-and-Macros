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
        // This is better than setting the duration of the animation to 0.0 because that will still result in the completion block being executed in a subsequent run loop.
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