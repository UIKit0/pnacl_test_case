#include "common.h"
#include <Foundation/Foundation.h>
#include <verde/verde_c_api.h>

@implementation NSFileManager

NSString * const NSFileAppendOnly = @"NSFileAppendOnly";
NSString * const NSFileCreationDate = @"NSFileCreationDate";
NSString * const NSFileDeviceIdentifier = @"NSFileDeviceIdentifier";
NSString * const NSFileExtensionHidden = @"NSFileExtensionHidden";
NSString * const NSFileGroupOwnerAccountID = @"NSFileGroupOwnerAccountID";
NSString * const NSFileGroupOwnerAccountName = @"NSFileGroupOwnerAccountName";
NSString * const NSFileHFSCreatorCode = @"NSFileHFSCreatorCode";
NSString * const NSFileHFSTypeCode = @"NSFileHFSTypeCode";
NSString * const NSFileImmutable = @"NSFileImmutable";
NSString * const NSFileModificationDate = @"NSFileModificationDate";
NSString * const NSFileOwnerAccountID = @"NSFileOwnerAccountID";
NSString * const NSFileOwnerAccountName = @"NSFileOwnerAccountName";
NSString * const NSFilePosixPermissions = @"NSFilePosixPermissions";
NSString * const NSFileReferenceCount = @"NSFileReferenceCount";
NSString * const NSFileSize = @"NSFileSize";
NSString * const NSFileSystemFileNumber = @"NSFileSystemFileNumber";
NSString * const NSFileSystemFreeNodes = @"NSFileSystemFreeNodes";
NSString * const NSFileSystemFreeSize = @"NSFileSystemFreeSize";
NSString * const NSFileSystemNodes = @"NSFileSystemNodes";
NSString * const NSFileSystemNumber = @"NSFileSystemNumber";
NSString * const NSFileSystemSize = @"NSFileSystemSize";
NSString * const NSFileType = @"NSFileType";
NSString * const NSFileTypeBlockSpecial = @"NSFileTypeBlockSpecial";
NSString * const NSFileTypeCharacterSpecial = @"NSFileTypeCharacterSpecial";
NSString * const NSFileTypeDirectory = @"NSFileTypeDirectory";
NSString * const NSFileTypeFifo = @"NSFileTypeFifo";
NSString * const NSFileTypeRegular = @"NSFileTypeRegular";
NSString * const NSFileTypeSocket = @"NSFileTypeSocket";
NSString * const NSFileTypeSymbolicLink = @"NSFileTypeSymbolicLink";
NSString * const NSFileTypeUnknown = @"NSFileTypeUnknown";

static NSFileManager *defaultManager = nil;

+ (NSFileManager *) defaultManager
{
    if (!defaultManager) {
        defaultManager = [[NSFileManager alloc] init];
    }
    return defaultManager;
}

void directoryContentsCallback(const char *file, void* files) {
    [(NSMutableArray*)files addObject:[NSString stringWithUTF8String:file]];
}

- (NSArray*) directoryContentsAtPath: (NSString*)path
{
    NSMutableArray *files = [NSMutableArray array];
    VerdePluginGetDirectoryContentsAtPath([path cString], &directoryContentsCallback, files);
    return files;
}

- (BOOL) fileExistsAtPath: (NSString*)path
{
    // TODO(jackson): Add a new API for this so we don't have to read the entire file to see if it exists
    char *buffer;
    int *length;
    BOOL result;
    if ([path hasPrefix:NSHomeDirectory()]) {
      result = VerdePluginLoadVirtualFile([path cString], NULL, NULL);
    } else {
      result = VerdePluginLoadActualFile([path cString], &buffer, &length);
      if (result) {
        free(buffer);
      }
    }
    return result;
}

- (BOOL) createDirectoryAtPath: (NSString *)path
   withIntermediateDirectories: (BOOL)flag
		    attributes: (NSDictionary *)attributes
                         error: (NSError **) error
{
    return VerdePluginCreateVirtualDirectory([path cString]);
}
- (BOOL) createDirectoryAtPath: (NSString*)path
		    attributes: (NSDictionary*)attributes
{
     return VerdePluginCreateVirtualDirectory([path cString]);
}

- (NSDirectoryEnumerator*) enumeratorAtPath: (NSString*)path
{
    // TODO(jackson): Support NSDirectoryEnumerator methods (directoryAttributes, etc.)
    return [[self directoryContentsAtPath:path] objectEnumerator];
}

@end
