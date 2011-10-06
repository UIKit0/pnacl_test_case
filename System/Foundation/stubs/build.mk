MODULE = System/Foundation/stubs

CCFLAGS = \
    -D__OBJC_RUNTIME_INTERNAL__=1 \
    -I$(SYSDIR)/objc \
    -I$(SYSDIR)/Foundation/Headers/Additions \
    -I$(SYSDIR)/Foundation/Headers \
    -I$(SYSDIR)/Foundation/Source \
    -I$(SYSDIR) \

OBJECTS = \
    accessors.o \
    GSFileHandle.o \
    GSFTPURLHandle.o \
    GSHTTPAuthentication.o \
    GSHTTPURLHandle.o \
    GSRunLoopCtxt.o \
    GSStream.o \
    NSBundle.o \
    NSConnection.o \
    NSFileManager.o \
    NSHost.o \
    NSMessagePort.o \
    NSMessagePortNameServer.o \
    NSSocketPort.o \
    NSSocketPortNameServer.o \
    NSStream.o \
    NSTask.o \
    objc-load.o \
    objc-class.o \
    syscall.o \

ifneq ($(OS), mac)
OBJECTS += strnstr.o
endif

include $(ROOTDIR)/module.mk
