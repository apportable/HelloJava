#import <BridgeKit/JavaObject.h>
#import <BridgeKit/JavaList.h>

@interface HelloBridge : JavaObject
@property (nonatomic, assign) int intValue;
- (id)initWithIntValue:(int)i doubleValue:(double)d;
- (void)setDoubleValue:(double)d;
- (double)doubleValue;
- (JavaList*)listValue;
@end