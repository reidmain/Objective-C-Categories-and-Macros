#import "NSObject+PerformBlock.h"


#pragma mark Class Definition

@implementation NSObject (PerformBlock)


#pragma mark -
#pragma mark Public Methods

- (void)performBlock: (dispatch_block_t)block 
	afterDelay: (NSTimeInterval)delay
{
	dispatch_time_t dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC);
	dispatch_after(dispatchTime, dispatch_get_current_queue(), block);
}

- (void)performBlockOnMainThread: (dispatch_block_t)block
{
	dispatch_sync(dispatch_get_main_queue(), block);
}

- (void)performBlockInBackground: (dispatch_block_t)block
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), block);
}


@end // @implementation NSObject (PerformBlock)