//
//  UILabel+dynamicSizeWidth.m
//

#import "UILabel+dynamicSizeWidth.h"

@interface UILabel()
- (CGSize)expectedSize;
@end

@implementation UILabel (dynamicSizeWidth)

-(void)resizeToStretch
{
    // get expected size
    [self setNumberOfLines:1];
    CGSize maximumLabelSize = CGSizeMake(9999,self.frame.size.height);
    CGSize size = [[self text] sizeWithFont:[self font]
                          constrainedToSize:maximumLabelSize
                              lineBreakMode:[self lineBreakMode]];
    
    // update the frame
    CGRect newFrame = [self frame];
    newFrame.size.width = size.width;
    
    // "anchor" point depends on text alignment
    CGFloat difference = newFrame.size.width - self.frame.size.width;
    switch (self.textAlignment) {
        case NSTextAlignmentCenter:
            newFrame.origin.x -= difference/2;
            break;
        case NSTextAlignmentRight:
            newFrame.origin.x -= difference;
            break;
        case NSTextAlignmentJustified:
            break;
        case NSTextAlignmentLeft:
            break;
        case NSTextAlignmentNatural:
            break;
    }
    
    [self setFrame:newFrame];
}

@end
