#pragma mark Class Interface

@interface UIView (Animations)


#pragma mark -
#pragma mark Static Methods

+ (void)animateIf: (BOOL)condition 
	duration: (NSTimeInterval)duration 
	delay: (NSTimeInterval)delay 
	options: (UIViewAnimationOptions)options 
	animations: (void (^)(void))animations 
	completion: (void (^)(BOOL finished))completion;


@end // @interface UIView (Animations)