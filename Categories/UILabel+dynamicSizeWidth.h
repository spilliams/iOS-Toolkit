//
//  UILabel+dynamicSizeWidth.h
//

#import <UIKit/UIKit.h>

/**
 Extends `UILabel` to provide support for resizing a label based on the size of
 its content
 */
@interface UILabel (dynamicSizeWidth)

/**
 Resizes the label to fit its content
 
 @warning Assumes the label is only 1 line
 */
- (void)resizeToStretch;

@end
