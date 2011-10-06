#import <CoreFoundation/CoreFoundation.h>

CFNumberType CFNumberGetType(CFNumberRef self)
{
	return (CFNumberType)[self type];
}
