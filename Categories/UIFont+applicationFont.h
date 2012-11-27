//
//  UIFont+applicationFont.h
//

#import <UIKit/UIKit.h>

/**
 Extends `UIFont` to provide methods to retrieve a custom application font
 */
@interface UIFont (applicationFont)

/**-----------------------------------------------------------------------------
 * @name Creating Application Fonts
 *  ----------------------------------------------------------------------------
 */
 
/**
 Returns the font object used for application interface items in the specified
 size
 
 @param fontSize The size (in points) to which the font is scaled. This value
 must be greater than 0.0.
 @return A font object of the specified size.
 */
+ (UIFont *)applicationFontOfSize:(CGFloat)fontSize;

/**
 Returns the font object used for application interface items that are rendered
 in bold type in the specified size
 
 @param fontSize The size (in points) to which the font is scaled. This value
 must be greater than 0.0.
 @return A font object of the specified size.
 */
+ (UIFont *)boldApplicationFontOfSize:(CGFloat)fontSize;

@end
