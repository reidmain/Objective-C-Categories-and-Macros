#import "NSDictionary+Accessing.h"
#import "FDNullOrEmpty.h"


#pragma mark Class Definition

@implementation NSDictionary (Accessing)


#pragma mark -
#pragma mark Public Methods

- (id)nonNullObjectForKey: (id)key
{
	id object = [self objectForKey: key];
	
	if (FDIsNull(object) == YES)
	{
		object = nil;
	}
	
	return object;
}


@end // @implementation NSDictionary (Accessing)