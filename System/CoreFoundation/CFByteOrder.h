#import <CoreFoundation/CFBase.h>
#include <stdint.h>

typedef enum {
   CFByteOrderUnknown,
   CFByteOrderLittleEndian,
   CFByteOrderBigEndian,
} CFByteOrder;

COREFOUNDATION_EXPORT CFByteOrder CFByteOrderGetCurrent(void);

COREFOUNDATION_EXPORT uint32_t CFSwapInt32LittleToHost(uint32_t arg);
COREFOUNDATION_EXPORT uint32_t CFSwapInt16BigToHost(uint32_t arg);
COREFOUNDATION_EXPORT uint32_t CFSwapInt32BigToHost(uint32_t arg);
COREFOUNDATION_EXPORT uint32_t CFSwapInt32(uint32_t arg);
COREFOUNDATION_EXPORT uint32_t CFSwapInt16(uint32_t arg);