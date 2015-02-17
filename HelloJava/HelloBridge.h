#import <BridgeKit/BK2JavaObject.h>

@interface HelloBridge : BK2JavaObject 
@property (nonatomic, assign) int intValue;
- (id)initWithIntValue:(int)i doubleValue:(double)d;
- (void)setDoubleValue:(double)d;
- (double)doubleValue;
@end
