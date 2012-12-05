//
// NSArray+KVO.h
//

#import <UIKit/UIKit.h>

/// Extends NSArray to provide some KVO-related filtering methods
@interface NSArray (KVO)

/** Returns the array's objects that have a specific value at a specific key path
 
 Example usage: `[persons objectsWithValue:@"July" atKeyPath:@"birthday.month"]`
 
 @param value The value
 @param keyPath The key path
 @return A subset of self
 */
- (NSArray*)objectsWithValue:(id)value atKeyPath:(NSString*)keyPath;

@end