#import <Foundation/Foundation.h>
#import <verde/verde_helpers.h>

static NSBundle* _mainBundle = nil;

@implementation NSBundle

+ (NSBundle *)mainBundle
{
    if (!_mainBundle)
        _mainBundle = [[NSBundle alloc] init];
    return _mainBundle;
}

+ (NSBundle*) bundleForClass: (Class)aClass
{
    // NOTIMPLEMENTED
    return [self mainBundle];
}

- (NSDictionary *) infoDictionary
{
    if (_infoDict)
        return _infoDict;

    NSString* path = [self pathForResource: @"Info" ofType: @"plist"];

    if (path)
    {
        _infoDict = [[NSDictionary alloc] initWithContentsOfFile: path];
    }
    else
    {
        _infoDict = RETAIN([NSDictionary dictionary]);
    }
    return _infoDict;
}

- (NSString*) pathForResource: (NSString*)name ofType: (NSString*)ext inDirectory: (NSString*)subPath
{
    return [self pathForResource:[[subPath stringByAppendingString:@"/"] stringByAppendingString:name] ofType:ext];
}

- (NSString*) pathForResource: (NSString*)name ofType: (NSString*)ext
{
    NSString *result = ext ? [[name stringByAppendingString:@"."] stringByAppendingString:ext] : name;
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:result];
    if (!exists)
      exists = [[NSFileManager defaultManager] fileExistsAtPath:[result stringByAppendingString:@".ogg"]];
    return exists ? result : nil;
}

- (NSString*) resourcePath
{
#ifdef TARGET_OS_android
// There should be a way to specify paths in the asset system vs. normal file system which is accessible in Android
// e.g. /:assets:/foo/bar. "" is the top level asset directory
    return @"";
#else
    return @"/";
#endif
}

- (NSString*) bundlePath
{
  return @"";
}

- (NSString*) localizedStringForKey: (NSString*)key value: (NSString*)value table: (NSString*)table
{
  // Cocotron implementation
  NSString     *result;
  NSString     *path;
  NSString     *contents=nil;
  NSDictionary *dictionary=nil;

  if ([table length] == 0)
    table = @"Localizable";

  if ((path = [self pathForResource:table ofType:@"strings"]) != nil) {
    if ((contents = [NSString stringWithContentsOfFile:path]) != nil) {
      dictionary = [contents propertyListFromStringsFileFormat];
    }
  }

  if ((result = [dictionary objectForKey:key]) == nil)
    result = (value != nil && [value length] > 0) ? value : key;

  result = (result == nil) ? @"" : result;

  return result;
}

@end
