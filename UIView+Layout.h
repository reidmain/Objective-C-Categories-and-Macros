#pragma mark Enumerations

typedef enum
{
	UIViewHorizontalAlignmentCenter = 0,
	UIViewHorizontalAlignmentLeft = 1,
	UIViewHorizontalAlignmentRight = 2
} UIViewHorizontalAlignment;

typedef enum
{
	UIViewVerticalAlignmentMiddle = 0,
	UIViewVerticalAlignmentTop = 1,
	UIViewVerticalAlignmentBottom = 2
} UIViewVerticalAlignment;


#pragma mark - Class Interface

@interface UIView (Layout)


#pragma mark - Properties

@property (nonatomic, assign) CGFloat xOrigin;
@property (nonatomic, assign) CGFloat yOrigin;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat xCenter;
@property (nonatomic, assign) CGFloat yCenter;


#pragma mark - Instance Methods

- (void)setPixelSnappedFrame: (CGRect)frame;
- (void)setPixelSnappedCenter: (CGPoint)center;

- (void)alignHorizontally: (UIViewHorizontalAlignment)horizontalAlignment;
- (void)alignVertically: (UIViewVerticalAlignment)verticalAlignment;
- (void)alignHorizontally: (UIViewHorizontalAlignment)horizontalAlignment 
	vertically: (UIViewVerticalAlignment)verticalAlignment;

- (void)removeAllSubviews;


@end