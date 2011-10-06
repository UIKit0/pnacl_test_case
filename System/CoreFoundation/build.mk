MODULE = System/CoreFoundation

CCFLAGS = \
    -I$(SYSDIR) \
    -I$(SYSDIR)/objc \
    -I$(SYSDIR)/Foundation/Headers/Additions \
    -I$(SYSDIR)/Foundation/Headers \
    -include $(SYSDIR)/MissingIncludes.h \
    -include $(SYSDIR)/CoreFoundation/CoreFoundation.h

OBJECTS = \
    CFArray.o \
    CFBase.o \
    CFByteOrder.o \
    CFBundle.o \
    CFData.o \
    CFDate.o \
    CFNumber.o \
    CFRunLoop.o \
    CFUUID.o \
    CFString.o \
    CFLocale.o \
    CFCharacterSet.o \
    CFURL.o \

include $(ROOTDIR)/module.mk
