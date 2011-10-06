#import <CoreFoundation/CFBase.h>

const CFAllocatorRef kCFAllocatorDefault = 0;
const CFAllocatorRef kCFAllocatorSystemDefault = 0;
const CFAllocatorRef kCFAllocatorMalloc = 0;
const CFAllocatorRef kCFAllocatorMallocZone = 0;
const CFAllocatorRef kCFAllocatorNull = 0;
const CFAllocatorRef kCFAllocatorUseContext = 0;

CFTypeRef CFRetain(CFTypeRef self){
	return (CFTypeRef)[(id) self retain];
}

void CFRelease(CFTypeRef self){
	[(id) self release];
}

CFIndex CFGetRetainCount(CFTypeRef self){
   return [(id) self retainCount];
   return 0;
}

CFAllocatorRef CFGetAllocator(CFTypeRef self){
   return 0;
}

CFHashCode CFHash(CFTypeRef self){
	return [(id)self hash];
}

Boolean CFEqual(CFTypeRef self,CFTypeRef other){
	return [(id) self isEqual:(id)other];
}

CFStringRef CFCopyTypeIDDescription(CFTypeID typeID){
	return 0;
}

CFStringRef CFCopyDescription(CFTypeRef self){
   return (CFStringRef)[[(id) self description] copy];
}

CFTypeRef CFMakeCollectable(CFTypeRef self){
   //does nothing on cocotron
   return 0;
}
