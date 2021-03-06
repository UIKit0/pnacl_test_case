#import "NSObject.h"
#import "GNUstepBase/GSBlocks.h"
@class NSTextCheckingResult;

typedef NSUInteger NSRegularExpressionOptions;
static const NSRegularExpressionOptions NSRegularExpressionCaseInsensitive             = 1<<0;
static const NSRegularExpressionOptions NSRegularExpressionAllowCommentsAndWhitespace  = 1<<1;
static const NSRegularExpressionOptions NSRegularExpressionIgnoreMetacharacters        = 1<<2;
static const NSRegularExpressionOptions NSRegularExpressionDotMatchesLineSeparators    = 1<<3;
static const NSRegularExpressionOptions NSRegularExpressionAnchorsMatchLines           = 1<<4;
static const NSRegularExpressionOptions NSRegularExpressionUseUnixLineSeparators       = 1<<5;
static const NSRegularExpressionOptions NSRegularExpressionUseUnicodeWordBoundaries    = 1<<6;

typedef NSUInteger NSMatchingFlags;
static const NSMatchingFlags NSMatchingProgress      = 1<<0;
static const NSMatchingFlags NSMatchingCompleted     = 1<<1;
static const NSMatchingFlags NSMatchingHitEnd        = 1<<2;
static const NSMatchingFlags NSMatchingRequiredEnd   = 1<<3;
static const NSMatchingFlags NSMatchingInternalError = 1<<4;

typedef NSUInteger NSMatchingOptions;
static const NSMatchingOptions NSMatchingReportProgress         = 1<<0;
static const NSMatchingOptions NSMatchingReportCompletion       = 1<<1;
static const NSMatchingOptions NSMatchingAnchored               = 1<<2;
static const NSMatchingOptions NSMatchingWithTransparentBounds  = 1<<3;
static const NSMatchingOptions NSMatchingWithoutAnchoringBounds = 1<<4;


DEFINE_BLOCK_TYPE(GSRegexBlock, void, NSTextCheckingResult*, NSMatchingFlags, BOOL*);

#ifndef GSREGEXTYPE
#define GSREGEXTYPE void
#endif

@interface NSRegularExpression : NSObject <NSCoding, NSCopying>
{
	@private
	GSREGEXTYPE *regex;
	NSRegularExpressionOptions options;
}
+ (NSRegularExpression*)regularExpressionWithPattern: (NSString*)aPattern
                                             options: (NSRegularExpressionOptions)opts
                                               error: (NSError**)e;
- initWithPattern: (NSString*)aPattern
          options: (NSRegularExpressionOptions)opts
            error: (NSError**)e;
+ (NSRegularExpression*)regularExpressionWithPattern: (NSString*)aPattern
                                             options: (NSRegularExpressionOptions)opts
                                               error: (NSError**)e;
- initWithPattern: (NSString*)aPattern
          options: (NSRegularExpressionOptions)opts
            error: (NSError**)e;
- (NSString*)pattern;
- (void)enumerateMatchesInString: (NSString*)string
                         options: (NSMatchingOptions)options
                           range: (NSRange)range
                      usingBlock: (GSRegexBlock)block;
- (NSUInteger)numberOfMatchesInString: (NSString*)string
                              options: (NSMatchingOptions)options
                                range: (NSRange)range;

- (NSTextCheckingResult*)firstMatchInString: (NSString*)string
                                    options: (NSMatchingOptions)options
                                      range: (NSRange)range;
- (NSArray*)matchesInString: (NSString*)string
                    options:(NSMatchingOptions)options
                      range:(NSRange)range;
- (NSRange)rangeOfFirstMatchInString: (NSString*)string
                             options: (NSMatchingOptions)options
                               range: (NSRange)range;
- (NSUInteger)replaceMatchesInString: (NSMutableString*)string
                             options: (NSMatchingOptions)options
                               range: (NSRange)range
                        withTemplate: (NSString*)template;
- (NSString*)stringByReplacingMatchesInString: (NSString*)string
                                      options: (NSMatchingOptions)options
                                        range: (NSRange)range
                                 withTemplate: (NSString*)template;
- (NSString*)replacementStringForResult: (NSTextCheckingResult*)result
                               inString: (NSString*)string
                                 offset: (NSInteger)offset
                               template: (NSString*)template;
#if GS_HAS_DECLARED_PROPERTIES
@property (readonly) NSRegularExpressionOptions options;
@property (readonly) NSUInteger numberOfCaptureGroups;
#else
- (NSRegularExpressionOptions)options;
- (NSUInteger)numberOfCaptureGroups;
#endif
@end
