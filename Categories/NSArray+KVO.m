//
// NSArray+KVO.m
//

@implementation NSArray (KVO)

- (NSArray*)objectsWithValue:(id)value atKeyPath:(NSString*)keyPath
{
  NSMutableArray *matchedObjects = [NSMutableArray new];
  for (id object in self) {
    id aValue = [object valueForKeyPath:keyPath];
    if ([aValue isEqual:value]) {
      [matchedObjects addObject:object];
    }
  }
  if (matchedObjects.count == 0) {
    return nil;
  }
  else {
    return matchedObjects;
  }
}

@end