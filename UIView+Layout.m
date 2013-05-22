#import "UIView+Layout.h"


#pragma mark Class Definition

@implementation UIView (Layout)


#pragma mark - Properties

- (CGFloat)xOrigin
{
	CGFloat xOrigin = self.center.x - (self.width / 2.0f);
	
	return xOrigin;
}

- (void)setXOrigin: (CGFloat)xOrigin
{
	CGPoint viewCenter = self.center;
	
	// Floor the x origin to avoid subpixel rendering.
	viewCenter.x = floor(xOrigin) + (self.width / 2.0f);
	
	self.center = viewCenter;
}

- (CGFloat)yOrigin
{
	CGFloat yOrigin = self.center.y - (self.height / 2.0f);
	
	return yOrigin;
}

- (void)setYOrigin: (CGFloat)yOrigin
{
	CGPoint viewCenter = self.center;
	
	// Floor the y origin to avoid subpixel rendering.
	viewCenter.y = floorf(yOrigin) + (self.height / 2.0f);
	
	self.center = viewCenter;
}

- (CGFloat)width
{
	CGFloat width = self.bounds.size.width;
	
	return width;
}

- (void)setWidth: (CGFloat)width
{
	// Changing the width of a view through its bounds updates the view's x origin so it needs to be set again after the the bounds have been changed.
	CGFloat previousXOrigin = self.xOrigin;
	
	CGRect viewBounds = self.bounds;
	
	// Floor the width to avoid subpixel rendering.
	viewBounds.size.width = floorf(width);
	
	self.bounds = viewBounds;
	
	self.xOrigin = previousXOrigin;
}

- (CGFloat)height
{
	CGFloat height = self.bounds.size.height;
	
	return height;
}

- (void)setHeight: (CGFloat)height
{
	// Changing the height of a view through its bounds updates the view's y origin so it needs to be set again after the the bounds have been changed.
	CGFloat previousYOrigin = self.yOrigin;
	
	CGRect viewBounds = self.bounds;
	
	// Floor the height to avoid subpixel rendering.
	viewBounds.size.height = floorf(height);
	
	self.bounds = viewBounds;
	
	self.yOrigin = previousYOrigin;
}

- (CGFloat)xCenter
{
	CGFloat xCenter = self.center.x;
	
	return xCenter;
}

- (void)setXCenter: (CGFloat)xCenter
{
	CGPoint center = self.center;
	
	// Calculate the x origin of the view around the new center point and floor it to avoid the sub pixel rendering that will occur if the width is an odd number.
	CGFloat xOrigin = floorf(xCenter - (self.width / 2.0f));
	
	center.x = xOrigin + (self.width / 2.0f);
	
	self.center = center;
}

- (CGFloat)yCenter
{
	CGFloat yCenter = self.center.y;
	
	return yCenter;
}

- (void)setYCenter: (CGFloat)yCenter
{
	CGPoint center = self.center;
	
	// Calculate the y origin of the view around the new center point and floor it to avoid the sub pixel rendering that will occur if the height is an odd number.
	CGFloat yOrigin = floorf(yCenter - (self.height / 2.0f));
	
	center.y = yOrigin + (self.height / 2.0f);
	
	self.center = center;
}


#pragma mark - Public Methods

- (void)setPixelSnappedFrame: (CGRect)frame
{
	// Floor the width and height of the frame to avoid subpixel rendering.
	CGRect bounds = CGRectMake(0.0f, 0.0f, floorf(frame.size.width), floorf(frame.size.height));
	
	// Floor the x and y origin of the frame to avoid subpixel rendering.
	CGPoint center = CGPointZero;
	center.x = floor(frame.origin.x) + (bounds.size.width / 2.0f);
	center.y = floorf(frame.origin.y) + (bounds.size.height / 2.0f);
	
	self.bounds = bounds;
	self.center = center;
}

- (void)setPixelSnappedCenter: (CGPoint)center
{
	// Calculate the x origin of the view around the new center point and floor it to avoid the sub pixel rendering that will occur if the width is an odd number.
	CGFloat xOrigin = floorf(center.x - (self.width / 2.0f));
	
	// Calculate the y origin of the view around the new center point and floor it to avoid the sub pixel rendering that will occur if the height is an odd number.
	CGFloat yOrigin = floorf(center.y - (self.height / 2.0f));
	
	// Calculate the new center of the view around the floored x and y origins.
	center.x = xOrigin + (self.width / 2.0f);
	center.y = yOrigin + (self.height / 2.0f);
	
	self.center = center;
}

- (void)alignHorizontally: (UIViewHorizontalAlignment)horizontalAlignment
{
	// If the view does not have a superview there is nothing to align it against.
	if (self.superview == nil)
	{
		return;
	}
	
	switch (horizontalAlignment)
	{
		case UIViewHorizontalAlignmentCenter:
		{
			self.xOrigin = (self.superview.width - self.width) / 2.0f;
			
			break;
		}
		
		case UIViewHorizontalAlignmentLeft:
		{
			self.xOrigin = 0.0f;
			
			break;
		}
		
		case UIViewHorizontalAlignmentRight:
		{
			self.xOrigin = self.superview.width - self.width;
			
			break;
		}
	}
}

- (void)alignVertically: (UIViewVerticalAlignment)verticalAlignment
{
	// If the view does not have a superview there is nothing to align it against.
	if (self.superview == nil)
	{
		return;
	}
	
	switch (verticalAlignment)
	{
		case UIViewVerticalAlignmentMiddle:
		{
			self.yOrigin = (self.superview.height - self.height) / 2.0f;
			
			break;
		}
		
		case UIViewVerticalAlignmentTop:
		{
			self.yOrigin = 0.0;
			
			break;
		}
		
		case UIViewVerticalAlignmentBottom:
		{
			self.yOrigin = self.superview.height - self.height;
			
			break;
		}
	}
}

- (void)alignHorizontally: (UIViewHorizontalAlignment)horizontalAlignment
	vertically: (UIViewVerticalAlignment)verticalAlignment
{
	// If the view does not have a superview there is nothing to align it against.
	if (self.superview == nil)
	{
		return;
	}
	
	CGFloat xOrigin = 0.0f;
	CGFloat yOrigin = 0.0f;
	
	switch (horizontalAlignment)
	{
		case UIViewHorizontalAlignmentCenter:
		{
			xOrigin = (self.superview.width - self.width) / 2.0f;
			
			break;
		}
		
		case UIViewHorizontalAlignmentLeft:
		{
			xOrigin = 0.0f;
			
			break;
		}
		
		case UIViewHorizontalAlignmentRight:
		{
			xOrigin = self.superview.width - self.width;
			
			break;
		}
	}
	
	switch (verticalAlignment)
	{
		case UIViewVerticalAlignmentMiddle:
		{
			yOrigin = (self.superview.height - self.height) / 2.0f;
			
			break;
		}
		
		case UIViewVerticalAlignmentTop:
		{
			yOrigin = 0.0;
			
			break;
		}
		
		case UIViewVerticalAlignmentBottom:
		{
			yOrigin = self.superview.height - self.height;
			
			break;
		}
	}
	
	CGRect frame = CGRectMake(xOrigin, yOrigin, self.width, self.height);
	
	[self setPixelSnappedFrame: frame];
}

- (void)removeAllSubviews
{
	[self.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
}


@end