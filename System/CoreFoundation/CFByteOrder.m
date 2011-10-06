#import <CoreFoundation/CFByteOrder.h>

CFByteOrder CFByteOrderGetCurrent(void)
{
    return CFByteOrderLittleEndian;
}

uint32_t CFSwapInt32LittleToHost(uint32_t arg)
{
    return arg;
}

uint32_t CFSwapInt16BigToHost(uint32_t arg)
{
    return CFSwapInt16(arg);
}

uint32_t CFSwapInt32BigToHost(uint32_t arg)
{
    return CFSwapInt32(arg);
}

uint32_t CFSwapInt32(uint32_t arg)
{
    return 0xFF000000 & (0x000000FF & arg) << 24
        || 0x00FF0000 & (0x0000FF00 & arg) << 8
        || 0x0000FF00 & (0x00FF0000 & arg) >> 8
        || 0x000000FF & (0xFF000000 & arg) >> 24;
}

// OpenCFLite CFByteOrder.h
uint32_t CFSwapInt16(uint32_t arg)
{
    return (uint16_t)(((arg << 8) & 0xFF00) | ((arg >> 8) & 0xFF));
}
