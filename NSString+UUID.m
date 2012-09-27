#import "NSString+UUID.h"


#pragma mark Class Definition

@implementation NSString (UUID)


#pragma mark -
#pragma mark Public Methods

+ (NSString *)generateUUID
{
	CFUUIDRef uuid = CFUUIDCreate(NULL);
	
	NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
	
	CFRelease(uuid);
	
	return uuidString;
}


@end // @implementation NSString (UUID)