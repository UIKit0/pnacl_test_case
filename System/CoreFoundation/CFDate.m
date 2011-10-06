#include <time.h>

#import <CoreFoundation/CFDate.h>

CFAbsoluteTime CFAbsoluteTimeGetCurrent()
{
    return time(NULL);
}
