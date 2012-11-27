//
//  UIFont+applicationFont.m
//

#import "UIFont+applicationFont.h"

@implementation UIFont (applicationFont)

static NSString *familyName = @"MyAppFontFamily";

+ (UIFont *)applicationFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:[NSString stringWithFormat:@"%@-Reg",familyName] size:fontSize];
}
+ (UIFont *)boldApplicationFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:[NSString stringWithFormat:@"%@-Bold",familyName] size:fontSize];
}

@end
