#import "MyBridgeObject.h"

@implementation MyBridgeObject
 
+ (void)initializeJava
{
    // Note: this must be called for any class that registers custom 
    // java apis, without this call the inheritance may not work as expected
    [super initializeJava]; 

    // Bridge registration methods must be called on the class and NOT self
    // even though that this is a static method (this preserves inheritance
    // to the correct java class
    [MyBridgeObject registerConstructorWithSelector:@selector(init)
                                       arguments:nil];
}

+ (NSString *)className
{
    return @"com.apportable.demo.MyBridgeObject";
}

@end