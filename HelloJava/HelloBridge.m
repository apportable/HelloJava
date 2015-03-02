#import "HelloBridge.h"

@implementation HelloBridge

// Any objc properties that are declared should declare dynamic,
// else automatic property sythesis will override the bridge registrations
@dynamic intValue;
 
+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom 
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava]; 

    // Bridge registration methods must be called on the class and NOT self
    // even though that this is a static method (this preserves inheritance
    // to the correct java class
    [HelloBridge registerConstructorWithSelector:@selector(initWithIntValue:doubleValue:)
                                       arguments:[BK2JavaClass intPrimitive], [BK2JavaClass doublePrimitive], nil];
    
    [HelloBridge registerInstanceMethod:@"getIntValue"
                               selector:@selector(intValue)
                            returnValue:[BK2JavaClass intPrimitive]];

    [HelloBridge registerInstanceMethod:@"setIntValue"
                               selector:@selector(setIntValue:)
                            arguments:[BK2JavaClass intPrimitive], nil];

    [HelloBridge registerInstanceMethod:@"getDoubleValue"
                               selector:@selector(doubleValue)
                            returnValue:[BK2JavaClass doublePrimitive]];

    [HelloBridge registerInstanceMethod:@"setDoubleValue"
                               selector:@selector(setDoubleValue:)
                            arguments:[BK2JavaClass doublePrimitive], nil];


    [HelloBridge registerCallback:@"bridgeCallback"
                         selector:@selector(valueChanged:doubleValue:)
                      returnValue:nil
                        arguments:[BK2JavaClass intPrimitive], [BK2JavaClass doublePrimitive], nil];
}

+ (NSString *)className
{
    return @"com.apportable.demo.HelloBridge";
}

- (void)valueChanged:(int)i doubleValue:(double)d
{
    NSLog(@"Objective-C callback valueChanged:%d doubleValue:%f", i, d);
}

@end
