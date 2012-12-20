//
//  UIImage+Tint.m
//
//  Created by Matt Gemmell on 04/07/2010.
//  Copyright 2010 Instinctive Code.

// see : https://github.com/mattgemmell/MGImageUtilities

//

/*
 
 
 if this license is onerous, i've used this before, and it's worked well:
 
 - (UIImage *)tintedImageUsingColor:(UIImage *)baseImage color:(UIColor *)tintColor {
 UIGraphicsBeginImageContext(baseImage.size);
 CGRect drawRect = CGRectMake(0, 0, baseImage.size.width, baseImage.size.height);
 [baseImage drawInRect:drawRect];
 [tintColor set];
 UIRectFillUsingBlendMode(drawRect, kCGBlendModeSourceAtop);
 UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
 UIGraphicsEndImageContext();
 return tintedImage;
 }
 
 
 
 */


#import "UIImage+Tint.h"


@implementation UIImage (MGTint)


- (UIImage *)imageTintedWithColor:(UIColor *)color
{
	// This method is designed for use with template images, i.e. solid-coloured mask-like images.
	return [self imageTintedWithColor:color fraction:0.0]; // default to a fully tinted mask of the image.
}


- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction
{
	if (color) {
		// Construct new image the same size as this one.
		UIImage *image;
		
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_4_0
		if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
			UIGraphicsBeginImageContextWithOptions([self size], NO, 0.f); // 0.f for scale means "scale for device's main screen".
		} else {
			UIGraphicsBeginImageContext([self size]);
		}
#else
		UIGraphicsBeginImageContext([self size]);
#endif
		CGRect rect = CGRectZero;
		rect.size = [self size];
		
		// Composite tint color at its own opacity.
		[color set];
		UIRectFill(rect);
		
		// Mask tint color-swatch to this image's opaque mask.
		// We want behaviour like NSCompositeDestinationIn on Mac OS X.
		[self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
		
		// Finally, composite this image over the tinted mask at desired opacity.
		if (fraction > 0.0) {
			// We want behaviour like NSCompositeSourceOver on Mac OS X.
			[self drawInRect:rect blendMode:kCGBlendModeSourceAtop alpha:fraction];
		}
		image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		
		return image;
	}
	
	return self;
}



- (UIImage *)tintedWithLinearGradientColors:(NSArray *)colorsArr {
    CGFloat scale = self.scale;
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width * scale, self.size.height * scale));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width * scale, self.size.height * scale);
    CGContextDrawImage(context, rect, self.CGImage);
    
    // Create gradient
    
    UIColor *colorOne = [colorsArr objectAtIndex:1]; // top color
    UIColor *colorTwo = [colorsArr objectAtIndex:0]; // bottom color
    
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil];
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(space, (__bridge CFArrayRef)colors, NULL);
    
    // Apply gradient
    
    CGContextClipToMask(context, rect, self.CGImage);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0,0), CGPointMake(0,self.size.height * scale), 0);
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return gradientImage;
}

@end
