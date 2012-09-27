#import "NSArray+Accessing.h"


#pragma mark Class Definition

@implementation NSArray (Accessing)


#pragma mark -
#pragma mark Public Methods

- (id)firstObject
{
	id firstObject = nil;
	
	if ([self count] > 0)
	{
		firstObject = [self objectAtIndex: 0];
	}
	
	return firstObject;
}

- (id)randomObject
{
	id object = nil;
	
	if ([self count] > 0)
	{
		int randomIndex = arc4random() % [self count];
		
		object = [self objectAtIndex: randomIndex];
	}
	
	return object;
}

- (id)tryObjectAtIndex: (NSUInteger)index
{
	id object = nil;
	
	if (index < [self count])
	{
		object = [self objectAtIndex: index];
	}
	
	return object;
}


@end // @implementation NSArray (Accessing)